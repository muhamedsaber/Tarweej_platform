import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? photoUrl;
  final String? accountCoverPhoto;
  final String? bio;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.photoUrl,
    this.accountCoverPhoto,
    this.bio,
  });

  // implement copy with
  UserModel copyWith({
    String? uid,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? photoUrl,
    String? accountCoverPhoto,
    String? bio,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      accountCoverPhoto: accountCoverPhoto ?? this.accountCoverPhoto,
      bio: bio ?? this.bio,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      photoUrl: json['photoUrl'],
      accountCoverPhoto: json['accountCoverPhoto'],
      bio: json['bio'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'accountCoverPhoto': accountCoverPhoto,
      'bio': bio,
    };
  }
  
  factory UserModel.fromCredentials(UserCredential credential) {
    return UserModel(
      uid: credential.user!.uid,
      email: credential.user!.email,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, photoUrl: $photoUrl, accountCoverPhoto: $accountCoverPhoto, bio: $bio)';
  }
}
