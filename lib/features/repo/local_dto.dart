import 'package:news_app/features/repo/home_repo.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourceResponse.dart';

class RemoteDs implements HomeRepoDs {
  @override
  Future<NewsDataModel> getNewsData(String searchQuery, String sourceID) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourceResponse> getSources(String categoryID) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}
