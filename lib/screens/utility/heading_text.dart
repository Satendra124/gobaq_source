import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:goblaq/styles/theme.dart';

class HeadingText extends StatelessWidget {
  HeadingText(
    this.text, {
    Key? key,
    this.textStyle = AppStyles.h2,
  }) : super(key: key);
  final String text;
  String underlineWord = "";
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    List<String> words = text.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].length > 4 &&
          words[i].startsWith('_%') &&
          words[i].endsWith('%_')) {
        underlineWord = words[i].substring(2, words[i].length - 2);
        words[i] = underlineWord;
      }
    }
    return Wrap(
      children: words
          .map((e) => _wordWidget(e == underlineWord, e, textStyle))
          .toList(),
    );
  }

  Widget _wordWidget(bool isUnderlined, String word, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        child: Text(
          word,
          style: style,
        ),
        decoration: isUnderlined
            ? const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage('assets/images/textStroke.png')),
              )
            : null,
      ),
    );
  }
}
