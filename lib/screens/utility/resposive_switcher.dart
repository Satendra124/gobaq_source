import 'package:flutter/material.dart';
import 'package:goblaq/screens/constants.dart';

/// makes a row or column accordint to [isMobile] being true of false
class ResponsiveSwitch extends StatefulWidget {
  ResponsiveSwitch(
      {Key? key,
      required this.childLeft,
      required this.childRight,
      this.reverse = false})
      : super(key: key);
  final Widget childLeft;
  final Widget childRight;
  final bool reverse;

  @override
  State<ResponsiveSwitch> createState() => _ResponsiveSwitchState();
}

class _ResponsiveSwitchState extends State<ResponsiveSwitch> {
  late bool isMobile;

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width <= kMobileBreakPoint;
    if (isMobile) {
      return Column(
        children: [
          widget.childLeft,
          widget.childRight,
        ],
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: widget.reverse
              ? [
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: widget.childRight)),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: widget.childLeft)),
                ]
              : [
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: widget.childLeft)),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: widget.childRight)),
                ],
        ),
      );
    }
  }
}
