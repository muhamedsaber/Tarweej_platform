class ApiConstants {
  static const String upsplashBaseUrl = "https://api.unsplash.com/";
  static const String upSplashAccessKey =
      "Dnn8cMxENEN1zFFnDiT07x8qYU6x7nTU7N3uYdKCK5A";
  static const String upSplashListPhotosEndpoint = "photos";
  static const String upSplashSearchPhotos = "search/photos";

  // datamuse
  static const String datamuseApiBaseUrl = "https://api.datamuse.com/";

  static const String datamuseWordsEndpoint = "words";

  static const Map<String, dynamic> upsplashRequestHeaders = {
    "Authorization": "Client-ID $upSplashAccessKey"
  };
}
