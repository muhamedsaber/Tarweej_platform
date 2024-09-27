class UpsplashSearchRequestModel {
  final int? page;
  final int? perPage;
  final String? orderBy;
  final String? color;
  final String? orientation;
  final String? query;
  final String? contentFilter;

  UpsplashSearchRequestModel(
      { this.page,
       this.perPage,
       this.orderBy,
       this.color,
        this.query,
       this.orientation,
       this.contentFilter});
  UpsplashSearchRequestModel copyWith({
    int? page,
    int? perPage,
    String? orderBy,
    String? color,
    String? orientation,
    String? contentFilter,
    String? query,
  }) {
    return UpsplashSearchRequestModel(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      orderBy: orderBy ?? this.orderBy,
      color: color ?? this.color,
      query: query ?? this.query,
      orientation: orientation ?? this.orientation,
      contentFilter: contentFilter ?? this.contentFilter,
    );
  }
}
