import 'package:flutter/material.dart';
import 'package:goblaq/screens/utility/heading_text.dart';
import 'package:goblaq/screens/utility/resposive_switcher.dart';
import 'package:goblaq/styles/theme.dart';
import '../strings.dart' as appStrings;

class WorkingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Working> workings = [
      new Working(
          appStrings.WORKING_INTREST_TITLE,
          appStrings.WORKING_INTREST_DESCRIPTION,
          'assets/images/working1.png',
          false),
      new Working(
          appStrings.WORKING_WEEKLY_TITLE,
          appStrings.WORKING_WEEKLY_DESCRIPTION,
          'assets/images/working2.png',
          true),
      new Working(
          appStrings.WORKING_MATCHED_TITLE,
          appStrings.WORKING_MATCHED_DESCRIPTION,
          'assets/images/working3.png',
          false),
    ];
    return Column(
      children: [
        HeadingText(appStrings.WORKING_HEADING),
        ...workings.map((e) => ResponsiveSwitch(
              reverse: e.reverse,
              childRight: Column(
                children: [
                  HeadingText(
                    e.title,
                    textStyle: AppStyles.h3.copyWith(color: AppColors.primary),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.description,
                      style: AppStyles.bodyText,
                    ),
                  ),
                ],
              ),
              childLeft: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(e.image),
              ),
            ))
      ],
    );
  }
}

class Working {
  final String title;
  final String description;
  final String image;
  final bool reverse;
  Working(this.title, this.description, this.image, this.reverse);
}
