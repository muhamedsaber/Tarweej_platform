class SearchKeywordModel {
  final String? word;
  final String? score;
  final List<String>? tags;
  SearchKeywordModel({
     this.word,
     this.score,
     this.tags,
  });

  // fromJson
  factory SearchKeywordModel.fromJson(Map<String, dynamic> json) {
    return SearchKeywordModel(
      word: json['word'],
      score: json['score'],
      tags: List<String>.from(json['tags']),
    );
  }
}