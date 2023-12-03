import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? phoneNumber;
  final String? emailAddress;
  final String? password;
  final String? cityMunicipality;
  final String? barangay;

  const UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.middleName,
    this.phoneNumber,
    this.emailAddress,
    this.password,
    this.cityMunicipality,
    this.barangay,
  });

  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    if (data == null) {
      return UserData();
    }
    return UserData(
        // id: data['id'],
        firstName: data['first_name'],
        lastName: data['last_name'],
        middleName: data['middle_name'],
        phoneNumber: data['phone_number'],
        emailAddress: data['email'],
        cityMunicipality: data['municipality'],
        barangay: data['barangay']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (firstName != null) "first_name": firstName,
      if (lastName != null) "last_name": lastName,
      if (middleName != null) "middle_name": middleName,
      if (phoneNumber != null) "phone_number": phoneNumber,
      if (emailAddress != null) "email": emailAddress,
      if (cityMunicipality != null) "municipality": cityMunicipality,
      if (barangay != null) "barangay": barangay,
    };
  }
}
