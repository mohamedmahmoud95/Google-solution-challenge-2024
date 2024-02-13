class Person {
  String? firstName;
  String? lastName;

  String? age;
  String? imageUrl;
  String? nationalId;
  String? address; //registered address on the found national id card (if found)
  String? lastSeenLocation;
  String? careGiverPhoneNumber;

  Person({
    this.firstName,
    this.lastName,
    this.age,
    this.imageUrl,
    this.nationalId,
    this.address,
    this.lastSeenLocation,
    this.careGiverPhoneNumber,
  });
}