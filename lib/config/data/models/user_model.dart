import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? name;
  final String? phoneNumber;
  final String? photoUrl;
  final String? accountCoverPhoto;
  final String? bio;
  final bool? isVerified;

  /// UserModel constructor
  UserModel({
    this.uid,
    this.email,
    this.name,
    this.phoneNumber,
    this.photoUrl,
    this.accountCoverPhoto,
    this.bio,
    this.isVerified,
  });

  //  copyWith method
  UserModel copyWith({
    String? uid,
    String? email,
    bool? isVerified,
    String? name,
    String? phoneNumber,
    String? photoUrl,
    String? accountCoverPhoto,
    String? bio,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      accountCoverPhoto: accountCoverPhoto ?? this.accountCoverPhoto,
      bio: bio ?? this.bio,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  //  fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      photoUrl: json['photoUrl'],
      accountCoverPhoto: json['accountCoverPhoto'],
      bio: json['bio'],
      isVerified: json['isVerified'],
    );
  }
  // toJson
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'accountCoverPhoto': accountCoverPhoto,
      'bio': bio,
      'isVerified': isVerified,
    };
  }

  // fromCredentials
  factory UserModel.fromCredentials(UserCredential credential) {
    return UserModel(
      uid: credential.user?.uid,
      email: credential.user?.email,
      photoUrl: credential.user?.photoURL,
      name: credential.user?.displayName,
      phoneNumber: credential.user?.phoneNumber,
      isVerified: credential.user?.emailVerified,
    );
  }
  // toString
  @override
  String toString() {
    return 'UserModel{uid: $uid, email: $email, name: $name, phoneNumber: $phoneNumber, photoUrl: $photoUrl, accountCoverPhoto: $accountCoverPhoto, bio: $bio, isVerified: $isVerified}';
  }
}
