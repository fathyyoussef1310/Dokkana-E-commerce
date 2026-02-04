import 'dart:io';

import 'package:dokkanaproject/Core/Common Widgets/ColorsManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/ProfileScreen/profiletile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final picker = ImagePicker();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  Future loadData() async {
    final prefs = await SharedPreferences.getInstance();

    nameController.text = prefs.getString("name") ?? "";
    emailController.text = prefs.getString("email") ?? "";

    String? imagePath = prefs.getString("image");

    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future saveData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("name", nameController.text);
    await prefs.setString("email", emailController.text);

    if (_image != null) {
      await prefs.setString("image", _image!.path);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Saved Successfully")),
    );
  }

  Future pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsmanager.White,
      appBar: AppBar(
        backgroundColor: Colorsmanager.White,
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: _image != null
                    ? FileImage(_image!)
                    : const AssetImage('assets/Images/1x/avatar (1).png') as ImageProvider,
              ),
            ),

            const SizedBox(height: 20),

            ProfileTile(
              icon: Icons.person_outlined,
              title: "Name",
              trailingChild: SizedBox(
                width: 150,
                child: TextField(
                  controller: nameController,
                  textAlign: TextAlign.end,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
              ),
            ),

            ProfileTile(
              icon: Icons.email_outlined,
              title: "Email",
              trailingChild: SizedBox(
                width: 150,
                child: TextField(
                  controller: emailController,
                  textAlign: TextAlign.end,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
              ),
            ),

            ProfileTile(
              icon: Icons.settings_outlined,
              title: "Settings",
            ),

            ProfileTile(
              icon: Icons.language,
              title: "Language",
            ),

            ProfileTile(
              icon: Icons.verified_user_outlined,
              title: "Two-Step Verification",
            ),

            ProfileTile(
              icon: Icons.edit_outlined,
              title: "Edit Profile",
            ),

            ProfileTile(
              icon: Icons.logout,
              title: "Log Out",
              color: Colorsmanager.red,
            ),

            ProfileTile(
              icon: Icons.delete_outline,
              title: "Delete Account",
              color: Colorsmanager.red,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveData,
              child: const Text("Save"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
