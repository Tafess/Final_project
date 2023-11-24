import 'dart:io';

import 'package:belkis_marketplace/models/user_model.dart';
import 'package:belkis_marketplace/provider/app_provider.dart';
import 'package:belkis_marketplace/widgets/primary_button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  void takePicture() async {
    XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (value != null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Setting')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        children: [
          image == null
              ? CupertinoButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      child: Icon(Icons.camera_alt)),
                )
              : CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(
                    image!,
                  ),
                ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: appProvider.getUserInformation.name),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: appProvider.getUserInformation.email),
          ),
          const SizedBox(height: 12),
          SizedBox(
              child: PrimaryButton(
                  onPressed: () async {
                    UserModel userModel = appProvider.getUserInformation
                        .copyWith(image: textEditingController.text);
                    appProvider.updateUserInfoFirebase(
                        context, userModel, image);
                  },
                  title: 'Update'))
        ],
      ),
    );
  }
}
