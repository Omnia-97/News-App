import 'package:flutter/material.dart';

import '../../../core/configs/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: Constants.primaryColor,
      style: const TextStyle(color: Constants.primaryColor, fontSize: 18),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        fillColor: Colors.white,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Constants.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Constants.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Constants.primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Constants.primaryColor),
        ),
        hintText: 'Search Article',
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: ImageIcon(
            AssetImage('assets/icons/ic_searchbar.png'),
            color: Constants.primaryColor,
          ),
        ),
        prefixIcon: InkWell(
          onTap: onTap,
          child: const ImageIcon(
            AssetImage('assets/icons/ic_cancel.png'),
            color: Constants.primaryColor,
          ),
        ),
        hintStyle: Constants.theme.textTheme.displayMedium?.copyWith(
          color: Constants.primaryColor.withOpacity(0.28),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
