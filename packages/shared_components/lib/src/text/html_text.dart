import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:shared_components/src/text/text.dart';

class HtmlText extends StatelessWidget {
  const HtmlText({
    super.key,
    required this.text,
    required this.onClick,
    this.textStyle,
  });

  final String text;
  final Function(String) onClick;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      _buildHtml(text),
      onTapUrl: (url) {
        onClick(url);
        return true;
      },
      enableCaching: true,
      buildAsync: true,
      textStyle:
          textStyle ??
          TextStyleHelper.apply(
            style: AppFontStyle.regular,
            size: FontStyleSize.body1,
          ),
    );
  }

  String _buildHtml(String s) {
    return s;
  }
}
