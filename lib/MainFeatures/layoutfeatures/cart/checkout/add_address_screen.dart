import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/material.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsmanager.lightcoffeeScreen,
      appBar: AppBar(
        title: const Text("Add new addresses"),
        centerTitle: true,
        backgroundColor: Colorsmanager.White,
        elevation: 0,
        foregroundColor: Colorsmanager.blackScreen,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _input("Name"),
            _input("Mobile No"),
            _input("Address"),
            Row(
              children: [
                Expanded(child: _input("Pin Code")),
                const SizedBox(width: 12),
                Expanded(child: _input("Town")),
              ],
            ),
            Row(
              children: [
                Expanded(child: _input("District")),
                const SizedBox(width: 12),
                Expanded(child: _input("State")),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(value: false, onChanged: (_) {}),
                const Text("Make this my default addresses"),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorsmanager.blackScreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Save",
                    style: TextStyle(color: Colorsmanager.White, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _input(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color(0xffF2F2F2),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}