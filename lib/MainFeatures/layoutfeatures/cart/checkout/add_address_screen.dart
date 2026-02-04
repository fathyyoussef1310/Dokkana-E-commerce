import 'package:dokkanaproject/Core/Common Widgets/ColorsManager.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Common Widgets/RoutesManager.dart';
import 'package:dokkanaproject/models/address_model.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  bool isDefault = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            _input("Name", nameController),
            _input("Mobile No", phoneController),
            _input("Address", addressController),
            Row(
              children: [
                Expanded(child: _input("Pin Code", pinController)),
                const SizedBox(width: 12),
                Expanded(child: _input("Town", townController)),
              ],
            ),
            Row(
              children: [
                Expanded(child: _input("District", districtController)),
                const SizedBox(width: 12),
                Expanded(child: _input("State", stateController)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: isDefault,
                  onChanged: (value) {
                    setState(() {
                      isDefault = value!;
                    });
                  },
                ),
                const Text("Make this my default addresses"),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  final address = AddressModel(
                    name: nameController.text,
                    phone: phoneController.text,
                    address: addressController.text,
                    pinCode: pinController.text,
                    town: townController.text,
                    district: districtController.text,
                    state: stateController.text,
                    isDefault: isDefault,
                  );

                  Navigator.pop(context, address);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorsmanager.blackScreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colorsmanager.White,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
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
