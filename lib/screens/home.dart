import 'package:flutter/material.dart';
import 'package:goblaq/screens/components/footer_section.dart';
import 'package:goblaq/screens/components/join_form.dart';
import 'package:goblaq/screens/components/join_section.dart';
import 'package:goblaq/screens/components/main_section.dart';
import 'package:goblaq/screens/components/mission_section.dart';
import 'package:goblaq/screens/components/working_section.dart';
import 'package:goblaq/screens/constants.dart';
import 'package:goblaq/screens/utility/app_button.dart';
import 'package:goblaq/screens/utility/top_bar.dart';
import 'package:goblaq/styles/theme.dart';

import 'strings.dart' as AppStrings;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isMobile;

  late double screenHeight;

  late double screenWidth;

  bool formOpen = false;
  void onFormClose() {
    setState(() {
      formOpen = false;
    });
  }

  void onFormOpen() {
    setState(() {
      formOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width <= kMobileBreakPoint;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: formOpen
            ? JoinForm(
                height: screenHeight,
                width: screenWidth,
                callback: onFormClose,
                isMobile: isMobile)
            : ListView(
                children: [
                  TopBar(
                      actionButtons: [isMobile ? Container() : _joinButton()]),
                  MainSection(isMobile: isMobile, onFormOpen: onFormOpen),
                  WorkingSection(),
                  SizedBox(height: 100),
                  MissionSection(),
                  SizedBox(height: 50),
                  JoinSection(width: screenWidth, onFormOpen: onFormOpen),
                  SizedBox(height: 50),
                  Footer(),
                ],
              ),
      ),
    );
  }

  Widget _joinButton() {
    return AppButton(
      AppStrings.JOIN_WAITLIST_BUTTON,
      width: 120,
      height: 50,
      callback: onFormOpen,
      showIcon: false,
    );
  }
}
