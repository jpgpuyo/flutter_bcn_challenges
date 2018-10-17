import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle = const TextStyle();

  static final tabTitle = baseTextStyle.copyWith(
    color: colorAccent,
  );

  static final tabOption = baseTextStyle.copyWith(
    color: colorAccent,
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
  );

  static final dummyTabIconSize = 150.0;

  static final dummyTabMessage = baseTextStyle.copyWith(
    fontSize: 40.0,
  );

  static final chatHeadline = baseTextStyle.copyWith(
    color: colorHeadLines,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
  );

  static final chatSubhead = baseTextStyle.copyWith(
    color: colorSubheads,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
  );

  static final chatTime = baseTextStyle.copyWith(
    color: colorSubheads,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
  );

  static final chatUnreadMessages = baseTextStyle.copyWith(
    color: colorPrimary,
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
  );
  static const colorPrimary = Colors.white;
  static const colorAccent = Color(0xFF0088FF);
  static const colorHeadLines = Color(0xFF000000);
  static const colorSubheads = Color(0xFF848484);
  static const colorBorders = Color(0xFFE2E2E2);

  static const colorBackground = Color(0xFFEFEFEF);
}
