import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/ProfileScreen/profiletile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsmanager.White,
      appBar: AppBar(
        backgroundColor: Colorsmanager.White,
        centerTitle: true,
        title: const Text("Profile"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/Images/1x/avatar (1).png'),
            ),
            const SizedBox(height: 20),
            ProfileTile(
              icon: Icons.person_outlined,
              title: "Name",
              value: " ",
            ),
            ProfileTile(
              icon: Icons.email_outlined,
              title: "Email",
              value: "",
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
          ],
        ),
      ),
    );
  }
}
