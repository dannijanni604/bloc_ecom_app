import 'package:bloc_ecom_app/bloc/products/products_bloc.dart';
import 'package:bloc_ecom_app/bloc/products/products_event.dart';
import 'package:bloc_ecom_app/bloc/products/products_state.dart';
import 'package:bloc_ecom_app/bloc/switch/switch_event.dart';
import 'package:bloc_ecom_app/bloc/switch/switch_state.dart';
import 'package:bloc_ecom_app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/custom_widgets/mobile/custom_app_bar.dart';
import '../../bloc/switch/switch_bloc.dart';
import '../../utils/enums.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: "ECOM", context: context),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              const Text('Slider'),
              BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.slider != current.slider,
                  builder: (context, state) {
                    return Container(width: 250, height: 100, color: Colors.purple.withOpacity(state.slider));
                  }),
              SizedBox(
                  width: 300,
                  child: BlocBuilder<SwitchBloc, SwitchState>(
                      buildWhen: (previous, current) => previous.slider != current.slider,
                      builder: (context, state) {
                        return Slider(
                            value: state.slider,
                            onChanged: (value) {
                              context.read<SwitchBloc>().add(SliderEvent(slider: value));
                            });
                      })),
              Row(children: [Text("Other Products", style: kFont20)]),
              Flexible(
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                      buildWhen: (previous, current) => previous.productsList != current.productsList,
                      builder: (context, state) {
                        switch (state.status) {
                          case Status.loading:
                            return const CircularProgressIndicator();
                          case Status.failure:
                            return Center(child: Text(state.responseMessage));
                          case Status.success:
                            return GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                itemCount: state.productsList.length,
                                itemBuilder: (context, index) {
                                  final product = state.productsList[index];
                                  return Card(
                                      child: Column(children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network('https://picsum.photos/id/$index/200/300', width: double.infinity, height: 100, fit: BoxFit.cover)),
                                    const SizedBox(height: 10),
                                    Padding(padding: const EdgeInsets.only(left: 3), child: Text(product.name!.toString(), overflow: TextOverflow.ellipsis, maxLines: 2))
                                  ]));
                                });
                        }
                      }))
            ])));
  }
}
