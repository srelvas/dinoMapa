import 'package:flutter/material.dart';

abstract class Sizes {
  // Horizontal Margin
  static const EdgeInsets horizontalMargin =
      const EdgeInsets.symmetric(horizontal: 15.0);
  static const EdgeInsets verticalMargin =
      const EdgeInsets.symmetric(vertical: 20.0);
  static const EdgeInsets bottomMargin = const EdgeInsets.only(bottom: 90.0);
  static const EdgeInsets contentMargin =
      EdgeInsets.symmetric(vertical: 9.0, horizontal: 3.0);

  // Border radius
  static const BorderRadius borderRadius =
      BorderRadius.all(const Radius.circular(6.0));

  // Title ident
  static const EdgeInsets ident = const EdgeInsets.only(left: 20.0);

  // Spacing
  static const double verticalSpacing = 15.0;
}
