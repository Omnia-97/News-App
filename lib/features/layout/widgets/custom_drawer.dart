import 'package:flutter/material.dart';
import 'package:news_app/core/configs/constants.dart';

class CustomDrawer extends StatelessWidget {
  final Function onDrawerClicked;
  static const int categoryID=1;
  static const int settingsID=2;

  const CustomDrawer({super.key, required this.onDrawerClicked, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.size.width * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: Constants.mediaQuery.size.width * 0.8,
            height: 140,
            color: Constants.theme.primaryColor,
            child: Text(
              'News App!',
              style: Constants.theme.textTheme.displayLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: (){
              onDrawerClicked(categoryID);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/icons/ic_list.png'),
                    color: Color(0xFF303030),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Categories',
                    style: Constants.theme.textTheme.displayLarge,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onDrawerClicked(settingsID);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,

                    color: Color(0xFF303030),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Settings',
                    style: Constants.theme.textTheme.displayLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
