import 'package:flutter/material.dart';
import 'package:news_app/core/configs/app_theme_manager.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/core/network/remote/api_manager.dart';
import 'package:news_app/features/layout/widgets/one_artical_widget.dart';
import 'package:news_app/features/layout/widgets/source_item.dart';

import '../../../models/SourceResponse.dart';

class TabItem extends StatefulWidget {
  List<Sources> sources;

  TabItem({super.key, required this.sources});

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12),
          child: DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.symmetric(horizontal: 6),
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              tabs: widget.sources
                  .map(
                    (e) => SourceItem(
                        selected: widget.sources.elementAt(selectedIndex) == e,
                        source: e),
                  )
                  .toList(),
            ),
          ),
        ),
        FutureBuilder(
          future:
              ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF39A552),
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('SomeThing went wrong'),
              );
            }
            var articles = snapshot.data?.articles ?? [];
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListView.builder(

                    itemBuilder: (context, index) {
                  return OneArticle(article: articles[index],);
                },
                  itemCount: articles.length,

                ),
              ),
            );
          },
        )
      ],
    );
  }
}
