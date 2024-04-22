import 'package:flutter/material.dart';
import 'package:news_app/features/bloc/cubit.dart';
import 'package:news_app/features/layout/widgets/one_article_widget.dart';
import 'package:news_app/features/layout/widgets/source_item.dart';

class TabItem extends StatefulWidget {
  final String searchQuery;

  const TabItem({
    super.key,
    required this.searchQuery,
  });

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12),
          child: DefaultTabController(
            length: HomeCubit.get(context).sources.length,
            child: TabBar(
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              onTap: (value) {
                HomeCubit.get(context).changeSelectedIndex(value);
                setState(() {});
              },
              tabs: HomeCubit.get(context)
                  .sources
                  .map(
                    (e) => SourceItem(
                        selected: HomeCubit.get(context).sources.elementAt(
                                HomeCubit.get(context).selectedIndex) ==
                            e,
                        source: e),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return OneArticle(
                  article: HomeCubit.get(context).articles[index],
                );
              },
              itemCount: HomeCubit.get(context).articles.length,
            ),
          ),
        ),
      ],
    );
  }
}
