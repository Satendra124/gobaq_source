import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:goblaq/styles/theme.dart';

class AppButton extends StatefulWidget {
  const AppButton(
    this.text, {
    Key? key,
    this.showIcon = true,
    required this.width,
    required this.height,
    required this.callback,
    this.color = AppColors.primaryDark,
    this.onAnimationColor = AppColors.onPrimary,
    this.animationFillColor = AppColors.secondary,
    this.animationOutColor = AppColors.primary,
    this.borderColor = AppColors.border,
  }) : super(key: key);
  final bool showIcon;
  final Color color;
  final Color onAnimationColor;
  final Color animationFillColor;
  final Color animationOutColor;
  final Color borderColor;
  final String text;
  final double width;
  final double height;
  final VoidCallback callback;
  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool cameIn = false;
  bool wentOut = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            cameIn = true;
            wentOut = false;
          });
        },
        onExit: (event) {
          setState(() {
            cameIn = false;
            wentOut = true;
          });
        },
        child: GestureDetector(
          onTap: widget.callback,
          child: Stack(
            children: [
              AnimatedContainer(
                width: cameIn ? widget.width : 0,
                decoration: BoxDecoration(
                    color: wentOut
                        ? widget.animationOutColor
                        : widget.animationFillColor,
                    borderRadius: BorderRadius.circular(widget.width)),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCirc,
              ),
              Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  border: Border.all(color: widget.borderColor),
                  borderRadius: BorderRadius.circular(widget.width),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedDefaultTextStyle(
                        child: Text(
                          widget.text,
                        ),
                        style: cameIn
                            ? AppStyles.buttonText.copyWith(
                                color: widget.onAnimationColor,
                              )
                            : AppStyles.buttonText.copyWith(
                                color: widget.color,
                              ),
                        curve: Curves.easeOutCirc,
                        duration: const Duration(milliseconds: 300)),
                    const SizedBox(width: 5),
                    widget.showIcon
                        ? AnimatedRotation(
                            turns: cameIn ? 0 : -0.125,
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: (cameIn
                                  ? widget.onAnimationColor
                                  : widget.color),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
