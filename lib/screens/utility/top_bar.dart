import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, this.actionButtons = const []}) : super(key: key);
  final List<Widget> actionButtons;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Image.asset("assets/images/logo.png"), ...actionButtons],
      ),
    );
  }
}
