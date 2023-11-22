import 'package:belkis_marketplace/constants/constants.dart';
import 'package:belkis_marketplace/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belkis_marketplace/widgets/primary_button/primary_button.dart';
import 'package:belkis_marketplace/screens/cart_screen.dart';
import 'package:belkis_marketplace/screens/favorite_screen.dart';
import 'package:belkis_marketplace/provider/app_provider.dart';
import 'package:belkis_marketplace/models/product_model/product_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;

  const ProductDetails({Key? key, required this.singleProduct})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance
                  .push(widget: const CartScreen(), context: context);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              // Routes.instance
              //     .push(widget: const FavoriteScreen(), context: context);
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(12.0, 12, 12, 30),
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              widget.singleProduct.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.singleProduct.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.singleProduct.isFavorite =
                        !widget.singleProduct.isFavorite;
                  });
                  if (widget.singleProduct.isFavorite) {
                    appProvider.addToFavoriteproduct(widget.singleProduct);
                    showMessage('Product added to favorites');
                  } else {
                    appProvider.removeFavoriteproduct(widget.singleProduct);
                    showMessage('Product removed from favorites');
                  }
                },
                icon: Icon(
                  appProvider.getFavoriteProductList
                          .contains(widget.singleProduct)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Text(
            widget.singleProduct.description,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              CupertinoButton(
                onPressed: () {
                  if (quantity >= 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
                padding: EdgeInsets.zero,
                child: const CircleAvatar(
                  maxRadius: 14,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.remove),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                quantity.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
                padding: EdgeInsets.zero,
                child: const CircleAvatar(
                  maxRadius: 14,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text('Total price: ${widget.singleProduct.price * quantity}'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  AppProvider appProvider = Provider.of(context, listen: false);
                  ProductModel productModel =
                      widget.singleProduct.copyWith(quantity: quantity);
                  appProvider.addToCartproduct(productModel);
                  showMessage('product added to cart');
                },
                child: const Text('ADD TO CART'),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                height: 40,
                width: 100,
                child: PrimaryButton(
                  onPressed: () {
                    Routes.instance
                        .push(widget: FavoriteScreen(), context: context);
                  },
                  title: 'BUY',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
