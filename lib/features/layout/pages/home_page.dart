import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/features/layout/pages/category_page.dart';
import 'package:news_app/features/layout/widgets/custom_textformfield.dart';
import 'package:news_app/features/settings/pages/setting_view.dart';
import 'package:news_app/main.dart';
import '../../../models/category_model.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/custom_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoriesList = const [
    CategoryModel(
      id: 'sports',
      title: 'Sports',
      image: 'assets/images/sports.png',
      backgroundColor: Color(0xFF000000),
    ),
    CategoryModel(
      id: 'general',
      title: 'Politics',
      image: 'assets/images/politics.png',
      backgroundColor: Color(0xFF003E90),
    ),
    CategoryModel(
      id: 'health',
      title: "Health",
      image: 'assets/images/health.png',
      backgroundColor: Color(0xFFED1E79),
    ),
    CategoryModel(
      id: 'business',
      title: 'Business',
      image: 'assets/images/business.png',
      backgroundColor: Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: 'entertainment',
      title: 'Entertainment',
      image: 'assets/images/entertainment.png',
      backgroundColor: Color(0xFF4882CF),
    ),
    CategoryModel(
      id: 'science',
      title: 'Science',
      image: 'assets/images/science.png',
      backgroundColor: Color(0xFFF2D352),
    ),
  ];
  bool isSearching = false;
  bool settingView = false;
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    var appLocal = AppLocalizations.of(context)!;
    return CustomBackgroundWidget(
      child: Scaffold(
        drawer: isSearching
            ? null
            : CustomDrawer(
                onDrawerClicked: onDrawerClicked,
              ),
        appBar: isSearching
            ? AppBar(
                leadingWidth: 80.w,
                title: SizedBox(
                    width: 350.w,
                    height: 60.h,
                    child: CustomTextFormField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value!;
                        });
                      },
                      onTap: () {
                        isSearching = false;
                        searchQuery = '';
                        setState(() {});
                      },
                    )),
              )
            : AppBar(
                leadingWidth: 80.w,
                iconTheme: const IconThemeData(size: 35),
                title: settingView
                    ? Text(
                        appLocal.setting,
                        style: Constants.theme.textTheme.titleLarge,
                      )
                    : Text(
                        selectedCategory == null
                            ? 'News App'
                            : selectedCategory!.title,
                        style: Constants.theme.textTheme.titleLarge,
                      ),
                actions: [
                  if (selectedCategory != null && settingView == false)
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w,
                        ),
                        child: const ImageIcon(
                          AssetImage(
                            'assets/icons/ic_search.png',
                          ),
                          size: 27,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isSearching = !isSearching;
                        });
                      },
                    ),
                ],
              ),
        body: settingView
            ? const SettingView()
            : selectedCategory == null
                ? Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Pick your category\nof interest',
                          style: Constants.theme.textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF4F5A69),
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 20.w,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 4 / 5,
                            ),
                            itemBuilder: (context, index) => CategoryItemWidget(
                              index: index,
                              categoryModel: categoriesList[index],
                              onCategoryClicked: onCategoryClicked,
                            ),
                            itemCount: 6,
                          ),
                        )
                      ],
                    ),
                  )
                : CategoryView(
                    categoryModel: selectedCategory!,
                    categoryID: selectedCategory!.id,
                    searchQuery: searchQuery,
                  ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryClicked(CategoryModel categoryModel) {
    setState(() {
      selectedCategory = categoryModel;
    });
  }

  void onDrawerClicked(val) {
    if (val == CustomDrawer.categoryID) {
      selectedCategory = null;
      setState(() {
        if (settingView) {
          settingView = false;
        }
      });
      navigatorKey.currentState!.pop();
    } else if (val == CustomDrawer.settingsID) {
      selectedCategory == null;
      setState(() {
        settingView = true;
        navigatorKey.currentState!.pop();
      });
    }
  }
}
