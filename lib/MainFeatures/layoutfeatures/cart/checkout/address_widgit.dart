import 'package:flutter/material.dart';
import 'package:dokkanaproject/models/address_model.dart';

class AddressWidgit extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onRemove;
  final VoidCallback onEdit;

  const AddressWidgit({
    super.key,
    required this.address,
    required this.onRemove,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(address.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(address.phone),
          Text(address.address),
          Text("Pin Code: ${address.pinCode}"),
          Text("${address.town}, ${address.district}"),
          Text(address.state),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: onEdit,
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: onRemove,
                child: const Text(
                  "Remove",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
