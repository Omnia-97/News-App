import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/features/repo/home_repo.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourceResponse.dart';
import '../../core/configs/app_strings.dart';
import '../../core/configs/constants.dart';
import '../../core/network/remote/endpoints.dart';

class RemoteDS implements HomeRepoDs {
  @override
  Future<NewsDataModel> getNewsData(String searchQuery, String sourceID) async {
    Uri url = Uri.https(Constants.baseURl, EndPoints.newsDataEndPoints, {
      "sources": sourceID,
      "q": searchQuery,
    });
    http.Response response = await http.get(url, headers: {
      AppString.apiKeyHeader: Constants.apiKeyValue,
    });
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }

  @override
  Future<SourceResponse> getSources(String categoryID) async {
    Map<String, dynamic> queryParam = {
      'category': categoryID,
    };
    Uri url = Uri.https(
      Constants.baseURl,
      EndPoints.sourceEndPoint,
      queryParam,
    );
    http.Response response = await http.get(
      url,
      headers: {
        AppString.apiKeyHeader: Constants.apiKeyValue,
      },
    );
    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }
}
