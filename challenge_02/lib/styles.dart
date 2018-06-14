import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle = const TextStyle();

  static final titleBox =
      baseTextStyle.copyWith(color: Colors.white, fontSize: 18.0);
  static final subtitleBox = baseTextStyle.copyWith(
      color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w400);

  static final titleCard = titleBox.copyWith(color: Colors.black);
  static final subTitleCard =
      subtitleBox.copyWith(color: Colors.black, fontSize: 14.0);

  static final number =
      baseTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold);
}
