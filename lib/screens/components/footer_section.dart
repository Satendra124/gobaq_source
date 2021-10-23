import 'package:flutter/material.dart';
import 'package:goblaq/screens/utility/heading_text.dart';
import 'package:goblaq/screens/utility/resposive_switcher.dart';
import 'package:goblaq/styles/theme.dart';
import '../strings.dart' as appStrings;

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResponsiveSwitch(
          childLeft: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                  child: Image.asset("assets/images/logo.png")),
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                constraints: BoxConstraints(maxWidth: 400),
                child: Text(
                  appStrings.FOOTER_COMPANY_DESCRIPTION,
                  style: AppStyles.bodyText,
                ),
              ),
            ],
          ),
          childRight: Container(
            constraints: BoxConstraints(maxWidth: 500),
            child: Wrap(
              children: [
                _footerMenu("Company", ["Carrers", "Contact Us"]),
                _footerMenu("Support", ["help center"]),
                _footerMenu("Legal", ["Terms of service"]),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _socialIcon('facebook'),
            _socialIcon('instagram'),
            _socialIcon('youtube'),
            _socialIcon('twitter'),
          ],
        ),
        Container(
            padding: EdgeInsets.all(20), child: Text(appStrings.COPYRIGHT)),
      ],
    );
  }

  Widget _socialIcon(String name) => Container(
        padding: EdgeInsets.all(8),
        height: 40,
        width: 40,
        child: Image.asset('assets/images/$name.png'),
      );

  Container _footerMenu(String title, List<String> items) {
    return Container(
      width: 200,
      height: 150,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText(
            title,
            textStyle: AppStyles.h4,
          ),
          ...items.map((e) => Text(e)),
        ],
      ),
    );
  }
}
