class Address {
  final String street;
  final String name;
  final String phoneNumber;
  final int cityId;
  final String additionalInfo;

  Address({
    required this.street,
    required this.name,
    required this.phoneNumber,
    required this.cityId,
    this.additionalInfo = '',
  });

  
}
