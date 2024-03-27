import 'package:flutter/material.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/core/network/remote/api_manager.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/features/layout/widgets/tab_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  final String categoryID;
  final String searchQuery;
  const CategoryView({
    super.key,
    required this.categoryModel,
    required this.categoryID,
    required this.searchQuery,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: FutureBuilder(
        future: ApiManager.getSources(widget.categoryID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Constants.primaryColor,
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('SomeThing went wrong'),
            );
          }
          var sourceList = snapshot.data?.sources ?? [];
          return TabItem(
            sources: sourceList,
            searchQuery: widget.searchQuery,
          );
        },
      ),
    );
  }
}
