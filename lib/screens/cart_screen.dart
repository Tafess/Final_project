import 'package:belkis_marketplace/constants/constants.dart';
import 'package:belkis_marketplace/constants/routes.dart';
import 'package:belkis_marketplace/provider/app_provider.dart';
import 'package:belkis_marketplace/screens/cart_checkout.dart';
import 'package:belkis_marketplace/screens/single_cart.dart';
import 'package:belkis_marketplace/widgets/primary_button/primary_button.dart';
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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('My cart'),
        actions: const [
          Icon(Icons.shopping_bag),
        ],
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          height: 170,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ETB ${appProvider.totalPrice().toString()}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  title: 'Checkout',
                  onPressed: () {
                    appProvider.clearBuyProduct();
                    appProvider.addBuyProductCartList();
                    appProvider.clearCart();
                    if (appProvider.getBuyproductList.isEmpty) {
                      showMessage('Cart is empty');
                    } else {
                      Routes.instance.push(
                          widget: const CartItemCheckout(), context: context);
                    }
                  },
                )
              ],
            ),
          )),
      body: appProvider.getCartProductList.isEmpty
          ? const Center(
              child: Text('Empty cart'),
            )
          : ListView.builder(
              itemCount: appProvider.getCartProductList.length,
              itemBuilder: (ctx, index) {
                return SIngleCartItem(
                    singleProduct: appProvider.getCartProductList[index]);
              }),
    );
  }
}
