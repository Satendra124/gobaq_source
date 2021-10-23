import 'package:flutter/material.dart';
import 'package:goblaq/screens/utility/heading_text.dart';
import 'package:goblaq/screens/utility/image_gallery.dart';
import 'package:goblaq/screens/utility/resposive_switcher.dart';
import 'package:goblaq/styles/theme.dart';
import '../strings.dart' as appStrings;

class MissionSection extends StatelessWidget {
  const MissionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 400),
      child: Column(
        children: [
          ResponsiveSwitch(
            childLeft: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HeadingText(
                    appStrings.MISSION_HEADING,
                    textStyle: AppStyles.h2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Text(
                    appStrings.MISSION_DESCRIPTION,
                    style: AppStyles.bodyText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            childRight: Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 400),
              child: Text(
                appStrings.MISSION_SUBHEADING,
                style: AppStyles.sub1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ImageGallery(),
        ],
      ),
    );
  }
}
