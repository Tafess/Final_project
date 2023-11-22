import 'package:belkis_marketplace/constants/routes.dart';
import 'package:belkis_marketplace/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:belkis_marketplace/models/product_model/category_model/catagory_model.dart';
import 'package:belkis_marketplace/models/product_model/product_model.dart';
import 'package:belkis_marketplace/provider/app_provider.dart';
import 'package:belkis_marketplace/screens/category_view/category_view.dart';
import 'package:belkis_marketplace/screens/home/product_details/product_details.dart';
import 'package:belkis_marketplace/widgets/primary_button/primary_button.dart';
import 'package:belkis_marketplace/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];
  bool isLoding = false;

  @override
  void initState() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getUserInfoFirebase();
    getCategoyList();
    // getBestProducts();
    super.initState();
  }

  void getCategoyList() async {
    setState(() {
      isLoding = true;
    });

    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();
    productModelList.shuffle();
    setState(() {
      isLoding = false;
    });
  }

  void getBestProducts() async {
    setState(() {
      isLoding = true;
    });

    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();

    setState(() {
      isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TopTitles(title: '........', subtitle: ''),
      ),
      body: isLoding
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
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
                                  color: Colors.blue,
                                ),
                              ),
                              categoriesList.isEmpty
                                  ? const Center(
                                      child: Text('Category is Empty'),
                                    )
                                  : SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: categoriesList
                                            .map(
                                              (category) => Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                ),
                                                child: Column(
                                                  children: [
                                                    CupertinoButton(
                                                      padding: EdgeInsets.zero,
                                                      onPressed: () {
                                                        Routes.instance.push(
                                                            widget: CategoryView(
                                                                categoryModel:
                                                                    category),
                                                            context: context);
                                                      },
                                                      child: Card(
                                                        color: Colors.white,
                                                        elevation: 3,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: SizedBox(
                                                          height: 100,
                                                          width: 100,
                                                          child: Image.network(
                                                            category.image,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      category
                                                          .name, // Category name
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                              Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Products',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              productModelList.isEmpty
                                  ? const Center(
                                      child: Text('Best product is Empity'),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: GridView.builder(
                                          padding: EdgeInsets.only(bottom: 20),
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount: productModelList.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio: 0.8,
                                                  mainAxisSpacing: 20,
                                                  crossAxisSpacing: 20,
                                                  crossAxisCount: 2),
                                          itemBuilder: (ctx, index) {
                                            ProductModel singleProduct =
                                                productModelList[index];
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  Routes.instance.push(
                                                      widget: ProductDetails(
                                                          singleProduct:
                                                              singleProduct),
                                                      context: context);
                                                },
                                                child: Column(children: [
                                                  SizedBox(
                                                    height: 70,
                                                    width: double.infinity,
                                                    child: Image.network(
                                                      singleProduct.image,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Text(
                                                    singleProduct.name,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'ETB ${singleProduct.price.toStringAsFixed(2)}',
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 6.0,
                                                  ),
                                                  SizedBox(
                                                    height: 40,
                                                    width: 100,
                                                    child: PrimaryButton(
                                                      onPressed: () {
                                                        Routes.instance.push(
                                                            widget: ProductDetails(
                                                                singleProduct:
                                                                    singleProduct),
                                                            context: context);
                                                        // Routes.instance.push(
                                                        //     widget:
                                                        //         ProductDetails,
                                                        //     context: context);
                                                      },
                                                      title: 'Buy',
                                                    ),
                                                  ), // onPressed: () {}, child: Text("Buy"))
                                                ]),
                                              ),
                                            );
                                          }),
                                    ),
                            ]),
                      ),
                    ]),
              ),
            ),
    );
  }
}

// //List<ProductModel> bestProducts = [
//   ProductModel(
//       image: "assets/images/vegcart.jpg",
//       id: "1",
//       name: "Cosmotics",
//       price: "100",
//       description: "This is the beautiful product",
//       status: 'Pending',
//       isFavorite: false),
//   ProductModel(
//       image: "assets/images/cosmo1.jpg",
//       id: "2",
//       name: "Cosmotics",
//       price: "100",
//       description: "This is the beautiful product",
//       status: 'Pending',
//       isFavorite: false),
//   ProductModel(
//       image: "assets/images/cosmo2.jpg",
//       id: "3",
//       name: "Cosmotics",
//       price: "100",
//       description: "This is the beautiful product",
//       status: 'Pending',
//       isFavorite: false),
//   ProductModel(
//       image: "assets/images/cosmo3.jpg",
//       id: "4",
//       name: "Cosmotics",
//       price: "100",
//       description: "This is the beautiful product",
//       status: 'Pending',
//       isFavorite: false),
//   ProductModel(
//       image: "assets/images/Cosmetics.jpg",
//       id: "5",
//       name: "Cosmotics",
//       price: "100",
//       description: "This is the beautiful product",
//       status: 'Pending',
//       isFavorite: false),
// ];
