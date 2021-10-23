import 'package:flutter/material.dart';
import 'package:goblaq/screens/utility/app_button.dart';
import 'package:goblaq/screens/utility/heading_text.dart';
import 'package:goblaq/screens/utility/resposive_switcher.dart';
import 'package:goblaq/screens/utility/top_bar.dart';
import 'package:goblaq/styles/theme.dart';
import '../strings.dart' as appStrings;

class JoinForm extends StatelessWidget {
  const JoinForm(
      {Key? key,
      required this.height,
      required this.width,
      required this.callback,
      required this.isMobile})
      : super(key: key);
  final double height;
  final double width;
  final VoidCallback callback;
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TopBar(actionButtons: [_closeFormButton()]),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ResponsiveSwitch(
                  childLeft: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: HeadingText(
                            appStrings.FORM_HEADING,
                            textStyle: isMobile
                                ? AppStyles.h2
                                    .copyWith(color: AppColors.onPrimary)
                                : AppStyles.h1
                                    .copyWith(color: AppColors.onPrimary),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          constraints: BoxConstraints(maxWidth: 250),
                          child: Text(appStrings.FORM_DESCRIPTION,
                              textAlign: TextAlign.center,
                              style: AppStyles.bodyText.copyWith(
                                color: AppColors.onPrimary,
                              )),
                        )
                      ],
                    ),
                  ),
                  childRight: Container(
                    height: 500,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _joinFormField("Your Name", Icons.person),
                          _joinFormField("Your Email", Icons.email),
                          _joinFormField(
                            "I am a startup Founder",
                            Icons.keyboard_arrow_down_rounded,
                          ),
                          _joinFormField(
                            "Website or socila",
                            Icons.escalator_warning_sharp,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AppButton(
                            appStrings.JOIN_WAITLIST_BUTTON,
                            width: 250,
                            height: 60,
                            callback: () {},
                            color: AppColors.onPrimary,
                            borderColor: AppColors.onPrimary.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _closeFormButton() {
    return AppButton(
      "Go Back",
      width: 120,
      height: 50,
      callback: callback,
      showIcon: false,
    );
  }

  Padding _joinFormField(String helpText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Container(
        height: 50,
        constraints: BoxConstraints(maxWidth: 400),
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.onPrimary.withOpacity(0.2),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: AppStyles.sub1.copyWith(color: AppColors.onPrimary),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: helpText,
                  hintStyle: AppStyles.sub1.copyWith(
                    color: AppColors.onPrimary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Icon(
                icon,
                color: AppColors.onPrimary.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
