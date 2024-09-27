// states
import '../../../../../../core/networking/api/api_error_model.dart';
import '../../../data/models/search_keyword_model.dart';

class SearchKeywordsState {
  
}
class SearchKeywordsInitial extends SearchKeywordsState {
  
}
class SearchKeywordsLoading extends SearchKeywordsState {
  
}
class SearchKeywordsLoaded extends SearchKeywordsState {
 final List<SearchKeywordModel> keywords;

  SearchKeywordsLoaded({required this.keywords}); 
}
class SearchKeywordsError extends SearchKeywordsState {
 final ApiErrorModel error;

  SearchKeywordsError({required this.error}); 
}