import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  final Function onCategoryClicked;

  const CategoryItemWidget({
    super.key,
    required this.index,
    required this.onCategoryClicked,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClicked(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(25),
            topLeft: const Radius.circular(25),
            bottomLeft:
                index % 2 == 0 ? Radius.zero : const Radius.circular(25),
            bottomRight:
                index % 2 == 0 ? const Radius.circular(25) : Radius.zero,
          ),
          image: DecorationImage(image: AssetImage(categoryModel.image) ,
            fit: BoxFit.cover,)
        ),
        child: Padding(
          padding:  EdgeInsets.only(top: 153.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categoryModel.title,
                style: Constants.theme.textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
