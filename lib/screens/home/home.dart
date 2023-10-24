import 'package:belkis_marketplace/models/product_model/product_model.dart';
import 'package:belkis_marketplace/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopTitles(title: 'Belkis Marketplace', subtitle: ''),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                      width: double.infinity,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: CategoriesList.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(e),
                              ),
                            ),
                          ),
                        ).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                      width: double.infinity,
                      child: Divider(
                        color: Colors.green,
                        thickness: 3,
                      ),
                    ),
                    const Text(
                      'Best products',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: bestProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                crossAxisCount: 2),
                        itemBuilder: (ctx, index) {
                          ProductModel singleProduct = bestProducts[index];
                          return Container(
                            color: Colors.blue,
                            child: Column(children: [
                              Image.asset(
                                singleProduct.image,
                                scale: 10.0,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                singleProduct.name,
                                style: const TextStyle(
                            
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text('Price: ${singleProduct.price}  birr'),
                              const SizedBox(
                                height: 6.0,
                              ),
                              OutlinedButton(
                                  onPressed: () {}, child: Text("Buy"))
                            ]),
                          );
                        }),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}

List<String> CategoriesList = [
  "assets/images/cosmo2.jpg",
  "assets/images/cosmo3.jpg",
  "assets/images/cosmo1.jpg",
  "assets/images/vegcart.jpg",
  "assets/images/OIP.jpg",
  "assets/images/Cosmetics.jpg",
];

List<ProductModel> bestProducts = [
  ProductModel(
      image: "assets/images/vegcart.jpg",
      id: "1",
      name: "Cosmotics",
      price: "100",
      description: "This is the beautiful product",
      status: 'Pending',
      isFavorite: false),
  ProductModel(
      image: "assets/images/cosmo1.jpg",
      id: "2",
      name: "Cosmotics",
      price: "100",
      description: "This is the beautiful product",
      status: 'Pending',
      isFavorite: false),
  ProductModel(
      image: "assets/images/cosmo2.jpg",
      id: "3",
      name: "Cosmotics",
      price: "100",
      description: "This is the beautiful product",
      status: 'Pending',
      isFavorite: false),
];
