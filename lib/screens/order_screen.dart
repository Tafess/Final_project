// ignore_for_file: prefer_const_constructors

import 'package:belkis_marketplace/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:belkis_marketplace/models/order_model.dart';

import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('Orders'),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: FutureBuilder(
          future: FirebaseFirestoreHelper.instance.getUserOrder(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.isEmpty ||
                snapshot.data == null ||
                !snapshot.hasData) {
              return const Center(
                child: Text('No order found'),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                OrderModel orderModel = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.blue,
                        )),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey)),
                    title: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 140,
                            width: 150,
                            color: Colors.grey.shade400,
                            child: Image.network(
                              orderModel.products[0].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    orderModel.products[0].name,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                      'Quantity:${orderModel.products[0].quantity.toString()}'),
                                  SizedBox(height: 10),
                                  FittedBox(
                                    child: Text(
                                        'Total price: ETB ${orderModel.totalprice.toString()}'),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    orderModel.products[0].status,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    children: orderModel.products.length > 1
                        ? [
                            Text('Details'),
                            Divider(color: Colors.grey),
                            ...orderModel.products.map((singleProduct) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      color: Colors.grey.shade400,
                                      child: Image.network(
                                        singleProduct.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 140,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              singleProduct.name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                                'Quantity:${singleProduct.quantity.toString()}'),
                                            SizedBox(height: 10),
                                            FittedBox(
                                              child: Text(
                                                  'Price: ETB ${singleProduct.price.toString()}'),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              orderModel.products[0].status,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }).toList()
                          ]
                        : [],
                  ),
                );
              },
            );
          }),
    );
  }
}
