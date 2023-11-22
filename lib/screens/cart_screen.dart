import 'package:belkis_marketplace/models/product_model/product_model.dart';
import 'package:belkis_marketplace/provider/app_provider.dart';
import 'package:belkis_marketplace/screens/single_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('My cart'),
        actions: [
          const Icon(Icons.shopping_bag),
        ],
      ),
      body: appProvider.getCartProductList.isEmpty
          ? const Center(
              child: Text('Empty cart'),
            )
          : ListView.builder(
              itemCount: appProvider.getCartProductList.length,
              itemBuilder: (ctx, index) {
                return SIngleCartItem(
                    singleProduct: appProvider.getCartProductList[index]);
                // SizedBox(
                //   height: 100,
                //   width: 100,
                //   child: Image.network(
                //       'https://i5.walmartimages.com/asr/40b98f1d-f659-4a50-9216-892be4413d68_1.1cf52cdfee8f28796ce5fa8f769d98c2.jpeg?odnWidth=1000&odnHeight=1000&odnBg=ffffff'),
                // // ),
                // SizedBox(
                //   width: 10,
                // ),
                // Column(
                //   children: [Text('Name')],
                // )
              }),
    );
  }
}
