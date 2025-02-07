import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class Palette {
  static Color white = HexColor.fromHex('#ffffff');
  static Color black = HexColor.fromHex('#000000');
  static Color primaryBackground = HexColor.fromHex('#E2EDFE');
  static Color scaffoldBackground = HexColor.fromHex('#F7F6FB');

  static Color dividerColor = HexColor.fromHex('#E3E3E3');

  static Color formEditPencilColor = HexColor.fromHex("#9A9A9A");

  static Color primary = const Color.fromRGBO(48, 45, 129, 1);
  // static Color primary = HexColor.fromHex('#6909DD');
  static Color accent = HexColor.fromHex('#5663FF');
  static Color red = HexColor.fromHex('#BC002D');
  static Color containerColor = HexColor.fromHex('#F1F1F1');
  static Color gray = HexColor.fromHex('#e2e2e2');

  static Color primaryButtonColor = HexColor.fromHex('#4178c2');
  static Color switchButtonColor = HexColor.fromHex('#FAD200');
  static Color blackTextColor = HexColor.fromHex('#2C2D2F');
  static Color textFieldPlaceholderColor = HexColor.fromHex('#8C8C8C');

  static Color appGreenColor = HexColor.fromHex('#13D219');
  static Color confirmButtonColor = HexColor.fromHex('#34b044');

  static Color textFieldBoxBackground = HexColor.fromHex('#F5F5F7');

  static Color lightGreyTextColor = HexColor.fromHex('#747474');
  static Color iconColor = HexColor.fromHex('#6779b6');
  static Color primaryBlue = HexColor.fromHex('#6909DD');

  static Color buttonDisabled = const Color.fromRGBO(52, 98, 181, 0.15);
  static Color btnTextColor = HexColor.fromHex('#173042');
  static Color btnBorderColor = HexColor.fromHex('#D8DADC');
  static Color blackShade = HexColor.fromHex('#4D4D4D');
  static Color grayShade1 = HexColor.fromHex('#8D9298');
  static Color grayShade2 = HexColor.fromHex('#D9E6FF');
  static Color backgroundShade = HexColor.fromHex('#F8FAFF');
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  ///
  static toMaterial(String hex) {
    var color = fromHex(hex);
    MaterialColor(color.value, {500: Color(color.value)});
  }
}

var materialColor = const MaterialColor(0xFF337C36, {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
});
