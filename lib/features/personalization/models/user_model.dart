import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_shop_app/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // Helper function to get full name
  String get fullName => '$firstName $lastName';

  // Helper function to format phone number
  String get formattedPhoneNumber => CustomFormatter.formatPhoneNumber(phoneNumber);

  // Static function to split full name into first and last name
  static List<String> nameParts(String fullName) {
    final names = fullName.split(' ');
    return names;
  }

  // Static function to generate a username from the full name
  static String generateUsername(String fullName) {
    List<String> names = nameParts(fullName);
    String firstName = names[0].toLowerCase();
    String lastName = names[1].toLowerCase();

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "quickshop_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // Static function to create an empty user model
  static UserModel empty() {
    return UserModel(
      id: '',
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      phoneNumber: '',
      profilePicture: '',
    );
  }

  // factory method to create a UserModel from a Firebase document Snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null) {
      final data = snapshot.data()!;
      return UserModel(
        id: snapshot.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        userName: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}