import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:readmore/readmore.dart';
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
              /* SizedBox(
                width: 381.w,
                height: 70.h,
                child: SingleChildScrollView(
                  child: ReadMoreText(
                    product.description ?? "",
                    style: Styles.categoryText.copyWith(
                      color: AppColors.textColor.withOpacity(0.6),
                    ),
                    trimMode: TrimMode.Line,
                    trimLines: 3,
                    colorClickableText: AppColors.primaryColor,
                    trimExpandedText: ' Read less',
                    trimCollapsedText: 'Read more',
                    moreStyle: Styles.categoryText,
                  ),
                ),
              ),*/
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 24.h, left: 11.w, right: 12.w),
                        child: SizedBox(
                          height: 140.h,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ReadMoreText(
                              title.description ?? "",
                              style: Constants.theme.textTheme.displayMedium!.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                              trimMode: TrimMode.Line,
                              trimLines: 5,
                              colorClickableText: Constants.primaryColor,
                              trimExpandedText: ' Read less',
                              trimCollapsedText: 'Read more',
                              moreStyle: Constants.theme.textTheme.titleSmall!.copyWith(
                                color: Constants.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(228, 0.h, 30.w, 0),
                        child: Text(
                          'View Full Article',
                          style: Constants.theme.textTheme.displayMedium,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
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
                        ),
                      )
                    ],
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
