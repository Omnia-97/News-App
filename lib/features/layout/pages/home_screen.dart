import 'package:flutter/material.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/features/layout/pages/category_view.dart';
import 'package:news_app/features/settings/pages/setting_view.dart';
import 'package:news_app/main.dart';
import '../../../models/category_model.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoriesList = [
    CategoryModel(
      id: 'sports',
      title: 'Sports',
      image: 'assets/images/sports.png',
      backgroundColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: 'general',
      title: 'Politics',
      image: 'assets/images/Politics.png',
      backgroundColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      id: 'health',
      title: "Health",
      image: 'assets/images/health.png',
      backgroundColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      id: 'business',
      title: 'Business',
      image: 'assets/images/bussines.png',
      backgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: 'entertainment',
      title: 'Environment',
      image: 'assets/images/environment.png',
      backgroundColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: 'science',
      title: 'Science',
      image: 'assets/images/science.png',
      backgroundColor: const Color(0xFFF2D352),
    ),
  ];
  bool isSearching = false;



  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        drawer: isSearching ? null : CustomDrawer(onDrawerClicked: onDrawerClicked),
        appBar: AppBar(
          toolbarHeight: 67,
          leadingWidth: 80,
          iconTheme: const IconThemeData(size: 35),
          title: isSearching
              ? TextFormField(


          )
              : Text(
            selectedCategory == null ? 'News App' : selectedCategory!.title,
            style: Constants.theme.textTheme.titleLarge,
          ),
          actions: [
            if (selectedCategory != null)
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                  ),
                  child: ImageIcon(
                    AssetImage('assets/icons/ic_search.png'),
                    size: 27,
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  setState(() {
                    isSearching = !isSearching;
                  });
                },
              ),
          ],
        ),
        body: isSearching ? Container(
          child: Center(
            child: Text('Search Screen'),
          ),
        ):
        selectedCategory == null
            ?  Padding(
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
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
            : CategoryView(categoryModel: selectedCategory!,categoryID: selectedCategory!.id, ),
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
    if(val == CustomDrawer.categoryID){
      selectedCategory = null;
      setState(() {
        if (isSearching) {
          isSearching = false;
        }
      });
      navigatorKey.currentState!.pop();
    } else if(val == CustomDrawer.settingsID){
      selectedCategory == null;
      
    }


  }
}

