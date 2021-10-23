import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goblaq/screens/utility/app_button.dart';
import 'package:goblaq/screens/utility/heading_text.dart';
import 'package:goblaq/screens/utility/resposive_switcher.dart';
import 'package:goblaq/styles/theme.dart';
import '../strings.dart' as appStrings;

class MainSection extends StatelessWidget {
  const MainSection(
      {Key? key, required this.isMobile, required this.onFormOpen})
      : super(key: key);
  final bool isMobile;
  final VoidCallback onFormOpen;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: max(screenHeight, 700),
      child: ResponsiveSwitch(
        reverse: true,
        childLeft: Image.asset('assets/images/main.png'),
        childRight: Container(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadingText(
                  appStrings.HEADLINE,
                  textStyle: isMobile ? AppStyles.h2 : AppStyles.h1,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.fromLTRB(10, 10, 20.0, 5),
                  child: Text(
                    appStrings.HEADLINE_DESCRIPTION,
                    style: AppStyles.bodyText,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: AppButton(
                      appStrings.JOIN_WAITLIST_BUTTON,
                      width: 170,
                      height: 60,
                      callback: onFormOpen,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
