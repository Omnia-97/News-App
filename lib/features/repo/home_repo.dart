import 'package:news_app/models/NewsDataModel.dart';

import '../../models/SourceResponse.dart';

abstract class HomeRepoDs {
  Future<SourceResponse> getSources(String categoryID);
  Future<NewsDataModel> getNewsData(String searchQuery, String sourceID);
}
