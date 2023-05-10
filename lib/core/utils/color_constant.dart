import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray900Cc = fromHex('#cc1a1918');

  static Color whiteA70090 = fromHex('#90ffffff');

  static Color gray80000 = fromHex('#00393736');

  static Color gray80066 = fromHex('#66393736');

  static Color black9003f = fromHex('#3f000000');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color black900Dd = fromHex('#dd000000');

  static Color whiteA70014 = fromHex('#14ffffff');

  static Color black900 = fromHex('#000000');

  static Color yellow700 = fromHex('#ffc732');

  static Color deepPurpleA200A9 = fromHex('#a9795de3');

  static Color indigo50001 = fromHex('#3f32cc');

  static Color indigo50066 = fromHex('#663e33cd');

  static Color deepPurpleA200 = fromHex('#795de3');

  static Color gray90002 = fromHex('#121212');

  static Color gray90003 = fromHex('#202023');

  static Color gray90004 = fromHex('#292929');

  static Color indigo5001e = fromHex('#1e3e33cd');

  static Color blueGray400 = fromHex('#888888');

  static Color blueGray300 = fromHex('#9098b1');

  static Color gray900 = fromHex('#202022');

  static Color gray90001 = fromHex('#1a1918');

  static Color whiteA700A9 = fromHex('#a9ffffff');

  static Color whiteA70084 = fromHex('#84ffffff');

  static Color blue50 = fromHex('#eaefff');

  static Color black90033 = fromHex('#33000000');

  static Color gray9007f = fromHex('#7f1a1918');

  static Color whiteA7009d = fromHex('#9dffffff');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigo500 = fromHex('#3e33cd');

  static Color black90059 = fromHex('#59000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
