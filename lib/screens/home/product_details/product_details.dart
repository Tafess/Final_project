import 'package:belkis_marketplace/constants/constants.dart';
import 'package:belkis_marketplace/constants/routes.dart';

import 'package:belkis_marketplace/models/product_model/product_model.dart';
import 'package:belkis_marketplace/provider/app_provider.dart';
import 'package:belkis_marketplace/screens/cart_screen.dart';
import 'package:belkis_marketplace/widgets/primary_button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;

  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance.push(widget: CartScreen(), context: context);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.singleProduct.isFavorite =
                            !widget.singleProduct.isFavorite;
                      });
                      if (widget.singleProduct.isFavorite) {}
                    },
                    icon: Icon(
                      widget.singleProduct.isFavorite
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
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text('Total price: ${widget.singleProduct.price * quantity}'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      AppProvider appProvider =
                          Provider.of(context, listen: false);
                      ProductModel productModel =
                          widget.singleProduct.copyWith(quantity: quantity);
                      appProvider.addToCartproduct(productModel);
                      showMessage('product added to cart');
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => CartPage(
                      //         singleProduct: widget.singleProduct,
                      //         quantiy: quantiy)));
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
                      onPressed: () {},
                      title: 'BUY',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
