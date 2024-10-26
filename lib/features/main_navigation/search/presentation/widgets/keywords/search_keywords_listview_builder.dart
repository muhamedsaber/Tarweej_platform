import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

import '../../../../../../core/helpers/size.dart';
import '../../../data/models/search_keyword_model.dart';

class SearchKeywordsListViewBuilder extends StatelessWidget {
  const SearchKeywordsListViewBuilder(
      {super.key, required this.keywords, required this.onSelectKeyword});
  final List<SearchKeywordModel> keywords;
  final Function(SearchKeywordModel model) onSelectKeyword;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: keywords.length,
        itemBuilder: (context, index) {
          if (keywords[index].word != null) {
            return Padding(
              padding: AppPadding.screenHorizontal23,
              child: Row(
                children: [
                  const Icon(Icons.search),
                  horizontalSpace(2),
                  Expanded(
                    child: ListTile(
                      onTap: () {
                        onSelectKeyword(keywords[index]);

                        context.navigateTo(Routes.searchImagesResultView);
                      },
                      title: Text(
                        keywords[index].word!,
                        style: context.theme.font18OnSurfaceMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // if the keyword is null we return an empty widget
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
