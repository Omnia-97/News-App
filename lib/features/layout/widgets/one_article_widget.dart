import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/core/configs/pages_route_name.dart';
import 'package:news_app/main.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:timeago/timeago.dart' as timeago;

class OneArticle extends StatelessWidget {
  final Articles article;
  const OneArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorKey.currentState!
            .pushNamed(PageRouteName.titlePage, arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: Constants.primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.source?.name ?? "",
              style: Constants.theme.textTheme.displaySmall,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              article.title ?? "",
              style: Constants.theme.textTheme.displayMedium,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                timeago.format(DateTime.parse(article.publishedAt ?? "")),
                textAlign: TextAlign.end,
                style: Constants.theme.textTheme.headlineSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
