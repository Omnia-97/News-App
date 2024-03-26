import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/models/NewsDataModel.dart';

class OneArticle extends StatelessWidget {
  Articles article;
  OneArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? "",
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: Color(0xFF39A552),)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          
          SizedBox(
            height: 10,
          ),
          Text(
            article.source?.name ?? "",
            style: Constants.theme.textTheme.displaySmall,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            article.title ?? "",
            style: Constants.theme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
