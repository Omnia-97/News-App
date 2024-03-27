import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../core/configs/constants.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context)!.settings.arguments as Articles;
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          iconTheme: const IconThemeData(size: 35),
          title: Text(
            'News Title',
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: title.urlToImage ?? "",
                  fit: BoxFit.fill,
                  width: Constants.mediaQuery.size.width,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: const Color(0xFF39A552),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.source?.name ?? "",
                      style: Constants.theme.textTheme.displaySmall,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      title.title ?? "",
                      style: Constants.theme.textTheme.displayMedium,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        timeago.format(
                          DateTime.parse(title.publishedAt ?? ""),
                        ),
                        textAlign: TextAlign.end,
                        style: Constants.theme.textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: 383,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            title.description ?? "",
                            style: Constants.theme.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 210, right: 46),
                          child: Text(
                            'View Full Article',
                            style: Constants.theme.textTheme.displayMedium,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final Uri url =
                                Uri.parse(title.url ?? "https://flutter.dev");
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                              right: 16,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: Color(0xFF303030),
                              size: 22,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
