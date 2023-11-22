import 'package:belkis_marketplace/provider/app_provider.dart';
import 'package:belkis_marketplace/widgets/single_favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('Favorites'),
        actions: const [
          Icon(
            Icons.favorite,
            color: Colors.white,
          )
        ],
      ),
      body: appProvider.getFavoriteProductList.isEmpty
          ? const Center(
              child: Text('Favorite is empty'),
            )
          : ListView.builder(
              itemCount: appProvider.getFavoriteProductList.length,
              itemBuilder: (ctx, index) {
                return SingleFavoriteWidget(
                    singleProduct: appProvider.getFavoriteProductList[index]);
              }),
    );
  }
}
