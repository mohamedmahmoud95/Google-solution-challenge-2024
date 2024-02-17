// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum LostOrFound {lost, found} //lost = 0 , found = 1

class LostOrFoundPerson {
  String? firstName;
  String? lastName;
  String? age;
  String? imageUrl;
  String? nationalId;
  String? address; //registered address on the found national id card (if found)
  String? lastSeenLocation;
  String? careGiverPhoneNumber;
  LostOrFound? lostOrFound;
  String? id;

  LostOrFoundPerson({
    this.firstName,
    this.lastName,
    this.age,
    this.imageUrl,
    this.nationalId,
    this.address,
    this.lastSeenLocation,
    this.careGiverPhoneNumber,
    this.lostOrFound,
    this.id
  });

  LostOrFoundPerson copyWith({
    String? firstName,
    String? lastName,
    String? age,
    String? imageUrl,
    String? nationalId,
    String? address,
    String? lastSeenLocation,
    String? careGiverPhoneNumber,
    LostOrFound? lostOrFound,
    String? id,
  }) {
    return LostOrFoundPerson(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      imageUrl: imageUrl ?? this.imageUrl,
      nationalId: nationalId ?? this.nationalId,
      address: address ?? this.address,
      lastSeenLocation: lastSeenLocation ?? this.lastSeenLocation,
      careGiverPhoneNumber: careGiverPhoneNumber ?? this.careGiverPhoneNumber,
      lostOrFound: lostOrFound ?? this.lostOrFound,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'imageUrl': imageUrl,
      'nationalId': nationalId,
      'address': address,
      'lastSeenLocation': lastSeenLocation,
      'careGiverPhoneNumber': careGiverPhoneNumber,
      'lostOrFound': lostOrFound?.index,
      'id': id,
    };
  }

  factory LostOrFoundPerson.fromMap(Map<String, dynamic> map) {
    return LostOrFoundPerson(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      age: map['age'] != null ? map['age'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      nationalId: map['nationalId'] != null ? map['nationalId'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      lastSeenLocation: map['lastSeenLocation'] != null ? map['lastSeenLocation'] as String : null,
      careGiverPhoneNumber: map['careGiverPhoneNumber'] != null ? map['careGiverPhoneNumber'] as String : null,
      lostOrFound: map['lostOrFound'] != null ? LostOrFound.values[map['lostOrFound'] as int] : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LostOrFoundPerson.fromJson(String source) => LostOrFoundPerson.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LostOrFoundPerson(firstName: $firstName, lastName: $lastName, age: $age, imageUrl: $imageUrl, nationalId: $nationalId, address: $address, lastSeenLocation: $lastSeenLocation, careGiverPhoneNumber: $careGiverPhoneNumber, lostOrFound: $lostOrFound, id: $id)';
  }

  @override
  bool operator ==(covariant LostOrFoundPerson other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.age == age &&
      other.imageUrl == imageUrl &&
      other.nationalId == nationalId &&
      other.address == address &&
      other.lastSeenLocation == lastSeenLocation &&
      other.careGiverPhoneNumber == careGiverPhoneNumber &&
      other.lostOrFound == lostOrFound &&
      other.id == id;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      age.hashCode ^
      imageUrl.hashCode ^
      nationalId.hashCode ^
      address.hashCode ^
      lastSeenLocation.hashCode ^
      careGiverPhoneNumber.hashCode ^
      lostOrFound.hashCode ^
      id.hashCode;
  }
}
