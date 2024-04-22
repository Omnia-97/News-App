import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/configs/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../provider/my_provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocal = AppLocalizations.of(context)!;
    var provider = Provider.of<MyProvider>(context);

    List<String> languagesList = [
      appLocal.english,
      appLocal.arabic,
    ];
    return CustomBackgroundWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocal.language,
              style:
                  Constants.theme.textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 316,
              height: 53,
              child: CustomDropdown(
                  initialItem: provider.languageCode == 'en'
                      ? appLocal.english
                      : appLocal.arabic,
                  items: languagesList,
                  decoration: CustomDropdownDecoration(
                    closedSuffixIcon: const ImageIcon(
                      AssetImage('assets/images/arrow_down.png'),
                      color: Constants.primaryColor,
                    ),
                    expandedSuffixIcon: const ImageIcon(
                      AssetImage('assets/images/arrow_down.png'),
                      color: Constants.primaryColor,
                    ),
                    closedBorderRadius: BorderRadius.zero,
                    expandedBorderRadius: BorderRadius.zero,
                    closedFillColor: Colors.white,
                    expandedFillColor: Colors.white,
                    listItemStyle: Constants.theme.textTheme.bodyMedium!
                        .copyWith(color: Constants.primaryColor),
                    headerStyle: Constants.theme.textTheme.bodyMedium!
                        .copyWith(color: Constants.primaryColor),
                    closedBorder: Border.all(color: Constants.primaryColor),
                  ),
                  onChanged: (value) {
                    if (value == appLocal.english) {
                      provider.changeLanguage('en');
                    } else if (value == appLocal.arabic) {
                      provider.changeLanguage('ar');
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
