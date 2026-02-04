class AddressModel {
  final String name;
  final String phone;
  final String address;
  final String pinCode;
  final String town;
  final String district;
  final String state;
  final bool isDefault;

  AddressModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.pinCode,
    required this.town,
    required this.district,
    required this.state,
    required this.isDefault,
  });
}
