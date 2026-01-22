import 'package:flutter/material.dart';

class HightlightText extends StatelessWidget {
  final String text;
  final String highlight;
  final TextStyle textStyle;
  final TextStyle highlightStyle;
  final int? maxLines;

  const HightlightText({
    super.key,
    required this.text,
    required this.highlight,
    this.maxLines = 1,
    required this.textStyle,
    required this.highlightStyle,
  });

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> spans = [];

    final String lowerText = text.toLowerCase();
    final String lowerHighlight = highlight.toLowerCase();

    final highlightIndex = lowerText.indexOf(lowerHighlight);
    if (highlightIndex == -1) {
      spans.add(TextSpan(text: text, style: textStyle));
    } else {
      spans.add(
        TextSpan(text: text.substring(0, highlightIndex), style: textStyle),
      );
      spans.add(
        TextSpan(
          text: text.substring(
            highlightIndex,
            highlightIndex + highlight.length,
          ),
          style: highlightStyle,
        ),
      );
      spans.add(
        TextSpan(
          text: text.substring(highlightIndex + highlight.length),
          style: textStyle,
        ),
      );
    }
    return RichText(
      text: TextSpan(children: spans),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
