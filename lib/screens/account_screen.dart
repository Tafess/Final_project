import 'package:belkis_marketplace/provider/app_provider.dart';
import 'package:belkis_marketplace/widgets/primary_button/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('My profile'),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(children: [
              appProvider.getUserInformation.image == null
                  ? const Icon(
                      Icons.person_outline,
                      size: 100,
                    )
                  : Image.network(appProvider.getUserInformation.image!),
              Text(
                appProvider.getUserInformation.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                appProvider.getUserInformation.email,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 50,
                width: 160,
                child: PrimaryButton(
                  title: 'Edit Profile',
                  onPressed: () {},
                ),
              )
            ]),
          )),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.shopping_bag),
                    title: const Text('Your orders'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.favorite_border),
                    title: const Text('Favorites'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.info_outline),
                    title: const Text('About us'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.support),
                    title: const Text('Support'),
                  ),
                  ListTile(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      setState(() {});
                    },
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                  ),
                  const SizedBox(height: 16),
                  const Text('Version 1.0.0'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
