import 'package:bloc_ecom_app/bloc/whitelist/whitelist_bloc.dart';
import 'package:bloc_ecom_app/bloc/whitelist/whitelist_event.dart';
import 'package:bloc_ecom_app/bloc/whitelist/whitelist_state.dart';
import 'package:bloc_ecom_app/model/whitelist_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/custom_widgets/custom_app_bar.dart';
import '../../utils/themes/light_theme.dart';

class WhiteListView extends StatefulWidget {
  const WhiteListView({super.key});

  @override
  State<WhiteListView> createState() => _WhiteListViewState();
}

class _WhiteListViewState extends State<WhiteListView> {
  @override
  void initState() {
    super.initState();
    context.read<WhitelistBloc>().add(FetchWhiteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:       customAppBar(title: "ECOM", context: context),

        body: Column(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<WhitelistBloc, WhitelistState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failed:
              return const Center(
                child: Text('Something went wrong.'),
              );
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.whiteListItems.length,
                itemBuilder: (context, index) {
                  final item = state.whiteListItems[index];
                  return Card(
                    color: primaryColorLight,
                    child: ListTile(
                      title: Text(item.value),
                      trailing: IconButton(onPressed: () {
                        WhitelistItems whiteListItem =WhitelistItems(id: item.id, value: item.value,isFavourite: item.isFavourite?false:true);
                        context.read<WhitelistBloc>().add(FavouriteItem(item: whiteListItem));
                      }, icon: Icon(
                          item.isFavourite?Icons.favorite:
                          Icons.favorite_border)),
                    ),
                  );
                },
              );
          }
        },
                  ),
                ),
              ),
            ]));
  }
}
