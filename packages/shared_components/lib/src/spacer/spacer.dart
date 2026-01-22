import 'package:flutter/material.dart';

extension Spacer on double {
  Widget imVerticalSpace() {
    return SizedBox(height: this);
  }

  Widget imHorizontalSpace() {
    return SizedBox(width: this);
  }
}

extension SpacerExt on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
