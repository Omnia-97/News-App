import 'package:flutter/material.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/models/SourceResponse.dart';

class SourceItem extends StatelessWidget {
  Sources source;
  bool selected;
  SourceItem({super.key, required this.selected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
        decoration: BoxDecoration(
          color: selected ? Constants.theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Constants.theme.primaryColor, width: 2),
        ),
        child: Text(
          source.name ?? "",
          style: Constants.theme.textTheme.bodySmall?.copyWith(
            color: selected ? Colors.white : Constants.theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
