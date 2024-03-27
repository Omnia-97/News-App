import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/configs/app_strings.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/core/network/remote/endpoints.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryID) async {
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
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<NewsDataModel> getNewsData(
      String sourceID, String searchQuery) async {
    Uri url = Uri.https(Constants.baseURl, EndPoints.newsDataEndPoints, {
      "sources": sourceID,
      "q": searchQuery,
    });
    http.Response response = await http.get(url, headers: {
      AppString.apiKeyHeader: Constants.apiKeyValue,
    });
    var json = jsonDecode(response.body);
    return NewsDataModel.fromJson(json);
  }
}
