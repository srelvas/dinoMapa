import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*class AppTheme {
  static final ThemeData light = ThemeData(
    fontFamily: 'Uniform',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Palette.veryLightGray,
    accentColor: Palette.lime,
    canvasColor: Palette.veryLightGray,
    highlightColor: Platform.isAndroid ? null : Colors.transparent,
    splashColor: Platform.isAndroid ? null : Colors.transparent,
    colorScheme: ColorScheme.light(
      onSurface: Palette.purple,
      onPrimary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      color: Palette.veryLightGray,
      elevation: 0.0,
      brightness: Brightness.light,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Palette.veryLightGray,
      titleTextStyle: const TextStyle(
        fontSize: 18.0,
        color: Palette.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      button: const TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
      bodyText1: const TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      bodyText2: const TextStyle(
        fontSize: 14.0,
        color: Colors.white,
      ),
      subtitle1: const TextStyle(
        fontSize: 14.0,
        color: Palette.purple,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: const TextStyle(
        fontSize: 14.0,
        color: Palette.miceGray,
      ),
      headline3: const TextStyle(
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline4: const TextStyle(
        fontSize: 20.0,
        color: Palette.purple,
        fontWeight: FontWeight.bold,
      ),
      headline5: const TextStyle(
        fontSize: 18.0,
      ),
      headline6: const TextStyle(
        fontSize: 16.0,
        color: Palette.lime,
        fontWeight: FontWeight.bold,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: Palette.purple,
      cursorColor: Palette.purple,
      selectionColor: Palette.purple.withOpacity(0.1),
    ),
    buttonColor: Palette.purple,
    iconTheme: const IconThemeData(
      color: Palette.purple,
      size: 25.0,
    ),
    buttonTheme: ButtonThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.black12,
    ),
    shadowColor: Colors.black45,
    inputDecorationTheme: _inputDecorationTheme.copyWith(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white38,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white38,
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Palette.grayish,
      unselectedLabelStyle: const TextStyle(
        fontSize: 14.0,
        color: Palette.purple,
        fontWeight: FontWeight.bold,
      ),
      indicator: BoxDecoration(
        color: Palette.purple,
      ),
    ),
    dividerColor: Palette.purple,
  );

  static final ThemeData dark = ThemeData(
    fontFamily: 'Uniform',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    accentColor: Palette.lime,
    canvasColor: Palette.midnightBlue,
    highlightColor: Platform.isAndroid ? null : Colors.transparent,
    splashColor: Platform.isAndroid ? null : Colors.transparent,
    colorScheme: ColorScheme.dark(
      surface: Palette.purple,
      onPrimary: Palette.purple,
      onSurface: Colors.white,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: const TextStyle(
          inherit: false,
          fontFamily: '.SF Pro Display',
          fontSize: 21,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      brightness: Brightness.dark,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      titleTextStyle: const TextStyle(
        fontSize: 18.0,
        color: Palette.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      button: const TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
      bodyText1: const TextStyle(
        fontSize: 14.0,
        color: Colors.white,
      ),
      bodyText2: const TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      subtitle1: const TextStyle(
        fontSize: 14.0,
        color: Palette.ultraViolet,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: const TextStyle(
        fontSize: 14.0,
        color: Palette.miceGray,
      ),
      headline3: const TextStyle(
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline4: const TextStyle(
        fontSize: 20.0,
        color: Palette.ultraViolet,
        fontWeight: FontWeight.bold,
      ),
      headline5: const TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      ),
      headline6: const TextStyle(
        fontSize: 16.0,
        color: Palette.lime,
        fontWeight: FontWeight.bold,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: Palette.purple,
      cursorColor: Palette.purple,
      selectionColor: Palette.purple.withOpacity(0.4),
    ),
    iconTheme: const IconThemeData(
      color: Palette.ultraViolet,
      size: 25.0,
    ),
    shadowColor: Colors.white38,
    buttonColor: Palette.purple,
    buttonTheme: ButtonThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.black12,
    ),
    inputDecorationTheme: _inputDecorationTheme.copyWith(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Palette.grayish,
      unselectedLabelStyle: const TextStyle(
        fontSize: 14.0,
        color: Palette.purple,
        fontWeight: FontWeight.bold,
      ),
      indicator: BoxDecoration(
        color: Palette.purple,
      ),
    ),
    dividerColor: Palette.purple,
  );

  static final InputDecorationTheme _inputDecorationTheme = const InputDecorationTheme(
    border: InputBorder.none,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 15.0,
    ),
  );

  static NeumorphicStyle neumorphicStyle(BuildContext context) => NeumorphicStyle(
        depth: Theme.of(context).isLightMode ? -4.0 : 0.0,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(4),
        ),
        color: Colors.transparent,
        border: NeumorphicBorder(
          color: Theme.of(context).isLightMode ? Colors.white : Colors.white24,
          width: 1.0,
        ),
        shadowDarkColorEmboss: Theme.of(context).isLightMode ? Palette.grayish.withOpacity(0.25) : Palette.deepOcean,
        shadowLightColorEmboss: Theme.of(context).isLightMode ? Palette.grayish.withOpacity(0.25) : Palette.nightBlue,
        shape: NeumorphicShape.flat,
        intensity: 0.6,
      );

  static NeumorphicStyle neumorphicFormStyle(BuildContext context) => NeumorphicStyle(
        depth: -4.0,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(4),
        ),
        color: Colors.transparent,
        shadowDarkColorEmboss: Theme.of(context).isLightMode ? Colors.black45 : Colors.transparent,
        shadowLightColorEmboss: Theme.of(context).isLightMode ? Colors.black12 : null,
        shape: NeumorphicShape.flat,
        intensity: Theme.of(context).isLightMode ? 0.6 : 0.0,
      );

  static BoxDecoration boxDecoration(BuildContext context) => BoxDecoration(
        borderRadius: Sizes.borderRadius,
        color: Theme.of(context).canvasColor,
        border: Border.all(
          color: Theme.of(context).isLightMode ? Colors.white : Palette.midnightBlue,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).isLightMode ? Colors.white : Colors.black,
            offset: const Offset(-2.0, -2.0),
            blurRadius: 8.0,
          ),
          BoxShadow(
            color: Theme.of(context).isLightMode ? Palette.grayish.withOpacity(0.25) : Colors.black,
            offset: const Offset(2.0, 2.0),
            blurRadius: 8.0,
          ),
        ],
      );

  static double get elevation => 3.0;
}

abstract class Palette {
  static const black = const Color(0xff333333);
  static const darkGray = const Color(0xff232323);
  static const darkYellow = const Color(0xffffb453);
  static const deepOcean = const Color(0xff1e253a);
  static const errorColor = const Color(0xffff6d6d);
  static const gray = const Color(0xff373737);
  static const grayish = const Color(0xff958ca8);
  static const green = const Color(0xff6ff485);
  static const lime = const Color(0xff00faca);
  static const lightGreen = const Color(0xff95d158);
  static const miceGray = const Color(0xff999999);
  static const midnightBlue = const Color(0xff232b44);
  static const nightBlue = const Color(0xff27314C);
  static const purple = const Color(0xff633cd7);
  static const red = const Color(0xffff5753);
  static const shadowColor = const Color(0xffe5e6e7);
  static const skyBlue = const Color(0xff4384f4);
  static const teal = const Color(0xff3bc1c7);
  static const ultraViolet = const Color(0xff8042eb);
  static const veryDarkGray = const Color(0xff1c1c1e);
  static const veryLightGray = const Color(0xfff9fdfb);
  static const yellow = const Color(0xffe1ae23);
}
*/
