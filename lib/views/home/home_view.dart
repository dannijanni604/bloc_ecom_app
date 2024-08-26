import 'package:bloc_ecom_app/bloc/products/products_bloc.dart';
import 'package:bloc_ecom_app/bloc/products/products_event.dart';
import 'package:bloc_ecom_app/bloc/products/products_state.dart';
import 'package:bloc_ecom_app/bloc/switch/switch_state.dart';
import 'package:bloc_ecom_app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/custom_widgets/custom_app_bar.dart';
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
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                switch (state.status) {
                  case Status.loading:
                    return const Center(child: CircularProgressIndicator());
                  case Status.failure:
                    return Center(child: Text(state.responseMessage));
                  case Status.success:
                    return Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            isDense: true,
                            hintText: 'Search product',
                            suffixIcon: const Icon(Icons.search)),
                        onChanged: (value) {
                          context.read<ProductsBloc>().add(SearchProducts(value));
                        },
                      ),
                      Expanded(
                        child:
                        state.searchMessage.isNotEmpty?Center(child: Text(state.searchMessage)):
                        GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: state.temProductsList.isEmpty ? state.productsList.length : state.temProductsList.length,
                            itemBuilder: (context, index) {
                              if (state.temProductsList.isEmpty) {
                                final product = state.productsList[index];
                                return Card(
                                    child: Column(children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(product.image!, width: double.infinity, height: 100, fit: BoxFit.cover)),
                                      const SizedBox(height: 10),
                                      Padding(padding: const EdgeInsets.only(left: 3), child: Text(product.name!.toString(), overflow: TextOverflow.ellipsis, maxLines: 2))
                                    ]));
                              } else {
                                final product = state.temProductsList[index];
                                return Card(
                                    child: Column(children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(product.image!, width: double.infinity, height: 100, fit: BoxFit.cover)),
                                      const SizedBox(height: 10),
                                      Padding(padding: const EdgeInsets.only(left: 3), child: Text(product.name!.toString(), overflow: TextOverflow.ellipsis, maxLines: 2))
                                    ]));
                              }
                            }),)
                    ]);
                }

              },
            )));
  }
}
