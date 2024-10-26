class SearchKeywordModel {
   String? word;
   int? score;

  SearchKeywordModel({
    this.word,
    this.score,
  });

  factory SearchKeywordModel.fromJson(Map<String, dynamic> json) {
    return SearchKeywordModel(
      word: json['word'],
      score: json['score'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'score': score,
    };
  }
}
