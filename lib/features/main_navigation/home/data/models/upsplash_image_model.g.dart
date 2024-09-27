// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsplash_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsplashImageModel _$UpsplashImageModelFromJson(Map<String, dynamic> json) =>
    UpsplashImageModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      color: const ColorConverter().fromJson(json['color'] as String?),
      blurHash: json['blurHash'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      likedByUser: json['likedByUser'] as bool?,
      description: json['alt_description'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      currentUserCollections: (json['currentUserCollections'] as List<dynamic>?)
          ?.map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
      urls: json['urls'] == null
          ? null
          : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : PhotoLinks.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpsplashImageModelToJson(UpsplashImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'width': instance.width,
      'height': instance.height,
      'color': const ColorConverter().toJson(instance.color),
      'blurHash': instance.blurHash,
      'likes': instance.likes,
      'likedByUser': instance.likedByUser,
      'alt_description': instance.description,
      'user': instance.user,
      'currentUserCollections': instance.currentUserCollections,
      'urls': instance.urls,
      'links': instance.links,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      portfolioUrl: json['portfolio_url'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      totalLikes: (json['total_likes'] as num?)?.toInt(),
      totalPhotos: (json['total_photos'] as num?)?.toInt(),
      totalCollections: (json['total_collections'] as num?)?.toInt(),
      instagramUsername: json['instagram_username'] as String?,
      twitterUsername: json['twitter_username'] as String?,
      profileImage: json['profile_image'] == null
          ? null
          : ProfileImage.fromJson(
              json['profile_image'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : UserLinks.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'portfolio_url': instance.portfolioUrl,
      'bio': instance.bio,
      'location': instance.location,
      'total_likes': instance.totalLikes,
      'total_photos': instance.totalPhotos,
      'total_collections': instance.totalCollections,
      'instagram_username': instance.instagramUsername,
      'twitter_username': instance.twitterUsername,
      'profile_image': instance.profileImage?.toJson(),
      'links': instance.links?.toJson(),
    };

ProfileImage _$ProfileImageFromJson(Map<String, dynamic> json) => ProfileImage(
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$ProfileImageToJson(ProfileImage instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

UserLinks _$UserLinksFromJson(Map<String, dynamic> json) => UserLinks(
      self: json['self'] as String?,
      html: json['html'] as String?,
      photos: json['photos'] as String?,
      likes: json['likes'] as String?,
      portfolio: json['portfolio'] as String?,
    );

Map<String, dynamic> _$UserLinksToJson(UserLinks instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'photos': instance.photos,
      'likes': instance.likes,
      'portfolio': instance.portfolio,
    };

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      publishedAt: json['publishedAt'] as String?,
      lastCollectedAt: json['lastCollectedAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      coverPhoto: json['coverPhoto'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publishedAt': instance.publishedAt,
      'lastCollectedAt': instance.lastCollectedAt,
      'updatedAt': instance.updatedAt,
      'coverPhoto': instance.coverPhoto,
      'user': instance.user,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      raw: json['raw'] as String?,
      full: json['full'] as String?,
      regular: json['regular'] as String?,
      small: json['small'] as String?,
      thumb: json['thumb'] as String?,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
    };

PhotoLinks _$PhotoLinksFromJson(Map<String, dynamic> json) => PhotoLinks(
      self: json['self'] as String?,
      html: json['html'] as String?,
      download: json['download'] as String?,
      downloadLocation: json['downloadLocation'] as String?,
    );

Map<String, dynamic> _$PhotoLinksToJson(PhotoLinks instance) =>
    <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'download': instance.download,
      'downloadLocation': instance.downloadLocation,
    };
