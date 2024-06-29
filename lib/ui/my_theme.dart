import 'dart:ui';

import 'package:flutter/material.dart';

ThemeMode appThemeMode = ThemeMode.light;

ThemeMode getThemeMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
}

const dark1 = Color(0xff1c2834);

const lightBlue = Color(0xff0175c2);
const normalBlue = Color(0xff1967d2);

const lightGrey = Color(0xfff5f5f7);
const lightGrey2 = Color(0xffdddddd);
const lightGrey3 = Color(0xff6d7278);