import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension XResponsiveBuildContext on BuildContext {
  bool get isDisplayLargeThanMobile =>
      ResponsiveBreakpoints.of(this).largerThan(MOBILE);
}

extension XResponsiveFontSize on BuildContext {
  double get titleScaleFactor => isDisplayLargeThanMobile ? 1 : 0.8;
}

extension XMediaQuery on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
}
