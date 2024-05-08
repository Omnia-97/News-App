import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/features/bloc/cubit.dart';
import 'package:news_app/features/layout/widgets/tab_item.dart';
import 'package:news_app/features/repo/remote_dto.dart';
import 'package:news_app/models/category_model.dart';

import '../../bloc/states.dart';

class CategoryView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteDS())..getSources(categoryID),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: Constants.primaryColor,
                ),
              ),
            );
          } else if (state is HomeGetSourcesSuccessState ||
              state is ChangeSelectedSource ||
              state is HomeGetNewsSuccessState) {
            HomeCubit.get(context).getNewsData(searchQuery);
          }
        },
        builder: (context, state) {
          if (state is HomeGetSourcesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Constants.primaryColor,
              ),
            );
          } else {
            return CustomBackgroundWidget(
              child: TabItem(
                searchQuery: searchQuery,
              ),
            );
          }
        },
      ),
    );
  }
}
