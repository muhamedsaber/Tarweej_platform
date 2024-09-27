import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
part 'upsplash_image_model.g.dart';

class ColorConverter implements JsonConverter<Color?, String?> {
  const ColorConverter();
  @override
  Color? fromJson(String? json) {
    if (json == null) return null;
    return Color(int.parse(json.replaceFirst('#', '0xff')));
  }

  @override
  String? toJson(Color? color) {
    if (color == null) return null;
    return '#${color.value.toRadixString(16).padLeft(8, '0')}';
  }
}

@JsonSerializable()
class UpsplashImageModel {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? width;
  final int? height;
  @ColorConverter()
  final Color? color;
  final String? blurHash;
  final int? likes;
  final bool? likedByUser;
  @JsonKey(name: "alt_description")
  final String? description;
  final User? user;
  final List<Collection>? currentUserCollections;
  final Urls? urls;
  final PhotoLinks? links;

  UpsplashImageModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.likes,
    this.likedByUser,
    this.description,
    this.user,
    this.currentUserCollections,
    this.urls,
    this.links,
  });

  factory UpsplashImageModel.fromJson(Map<String, dynamic> json) =>
      _$UpsplashImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpsplashImageModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User {
  final String? id;
  final String? username;
  final String? name;
  @JsonKey(name: "portfolio_url")
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  @JsonKey(name: "total_likes")
  final int? totalLikes;
  @JsonKey(name: "total_photos")
  final int? totalPhotos;
  @JsonKey(name: "total_collections")
  final int? totalCollections;
  @JsonKey(name: "instagram_username")
  final String? instagramUsername;
  @JsonKey(name: "twitter_username")
  final String? twitterUsername;
  @JsonKey(name: "profile_image")
  final ProfileImage? profileImage;
  final UserLinks? links;

  User({
    this.id,
    this.username,
    this.name,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.totalLikes,
    this.totalPhotos,
    this.totalCollections,
    this.instagramUsername,
    this.twitterUsername,
    this.profileImage,
    this.links,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class ProfileImage {
  final String? small;
  final String? medium;
  final String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);
}

@JsonSerializable()
class UserLinks {
  final String? self;
  final String? html;
  final String? photos;
  final String? likes;
  final String? portfolio;

  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) =>
      _$UserLinksFromJson(json);
  Map<String, dynamic> toJson() => _$UserLinksToJson(this);
}

@JsonSerializable()
class Collection {
  final int? id;
  final String? title;
  final String? publishedAt;
  final String? lastCollectedAt;
  final String? updatedAt;
  final String? coverPhoto;
  final String? user;

  Collection({
    this.id,
    this.title,
    this.publishedAt,
    this.lastCollectedAt,
    this.updatedAt,
    this.coverPhoto,
    this.user,
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}

@JsonSerializable()
class Urls {
  final String? raw;
  final String? full;
  final String? regular;
  final String? small;
  final String? thumb;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);
  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}

@JsonSerializable()
class PhotoLinks {
  final String? self;
  final String? html;
  final String? download;
  final String? downloadLocation;

  PhotoLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  factory PhotoLinks.fromJson(Map<String, dynamic> json) =>
      _$PhotoLinksFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoLinksToJson(this);
}
