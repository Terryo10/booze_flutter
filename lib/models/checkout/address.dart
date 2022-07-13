class Address {
  final String street;
  final String name;
  final String phoneNumber;
  final int ? cityId;
  final String additionalInfo;

  Address({
    this.street = '',
    this.name = '',
    this.phoneNumber = '',
    this.cityId,
    this.additionalInfo = '',
  });
}
