class SearchImagesRequestModel {
  final String query;
  final int page;
  final int perPage;
  final String? orderBy;
  final String? color;
  final String? orientation;

  SearchImagesRequestModel(
      {required this.query,
      required this.page,
      required this.perPage,
      this.orderBy,
      this.color,
      this.orientation});

  SearchImagesRequestModel copyWith({
    String? query,
    int? page,
    int? perPage,
    String? orderBy,
    String? color,
    String? orientation,
  }) {
    return SearchImagesRequestModel(
      query: query ?? this.query,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      orderBy: orderBy ?? this.orderBy,
      color: color ?? this.color,
      orientation: orientation ?? this.orientation,
    );
  }
}
