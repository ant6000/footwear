import 'package:flutter/material.dart';
import 'package:footwear/v2/controller/provider/show_details_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<ShowProductDetailsProvider>(
          builder: (context, favoriteProvider, _) {
        return favoriteProvider.favriteList.isNotEmpty
            ? ListView.builder(
                itemCount: favoriteProvider.favriteList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      textColor: Colors.white,
                      tileColor: Colors.amber,
                      title: Text(favoriteProvider.favriteList[index].title,
                          style: const TextStyle(fontSize: 25)),
                      subtitle: Text(
                          favoriteProvider.favriteList[index].price.toString(),
                          style: const TextStyle(fontSize: 20)),
                      leading: Container(
                          height: 200, width: 100, color: Colors.orange),
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                'Your liked Products will appear here',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ));
      }),
    );
  }
}
