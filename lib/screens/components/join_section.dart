import 'package:flutter/material.dart';
import 'package:goblaq/screens/utility/app_button.dart';
import 'package:goblaq/screens/utility/heading_text.dart';
import 'package:goblaq/styles/theme.dart';
import '../strings.dart' as appStrings;

class JoinSection extends StatelessWidget {
  const JoinSection({Key? key, required this.width, required this.onFormOpen})
      : super(key: key);
  final double width;
  final VoidCallback onFormOpen;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: width,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          width: width,
          constraints: BoxConstraints(maxWidth: 1500, minHeight: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 350),
                child: HeadingText(
                  appStrings.JOIN_SECTION_HEADING,
                  textStyle: AppStyles.h2
                      .copyWith(color: AppColors.onPrimary, fontSize: 40),
                ),
              ),
              SizedBox(height: 10),
              AppButton(
                appStrings.JOIN_WAITLIST_BUTTON,
                width: 150,
                height: 60,
                callback: onFormOpen,
                borderColor: AppColors.onPrimary.withOpacity(0.1),
                color: AppColors.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
