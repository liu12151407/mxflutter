//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/src/painting/basic_types.dart';
import 'package:flutter/src/painting/colors.dart';
import 'package:flutter/src/painting/strut_style.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerTextStyleSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_textStyle.funName] = _textStyle;
  return m;
}
var _textStyle = MXFunctionInvoke(
    "TextStyle",
    (
      {
      bool inherit = true,
      Color color,
      Color backgroundColor,
      dynamic fontSize,
      FontWeight fontWeight,
      FontStyle fontStyle,
      dynamic letterSpacing,
      dynamic wordSpacing,
      TextBaseline textBaseline,
      dynamic height,
      Locale locale,
      Paint foreground,
      Paint background,
      List<Shadow> shadows,
      List<FontFeature> fontFeatures,
      TextDecoration decoration,
      Color decorationColor,
      TextDecorationStyle decorationStyle,
      dynamic decorationThickness,
      String debugLabel,
      String fontFamily,
      List<String> fontFamilyFallback,
      String package,
      }
    ) =>
      TextStyle(
      inherit: inherit,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize?.toDouble(),
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing?.toDouble(),
      wordSpacing: wordSpacing?.toDouble(),
      textBaseline: textBaseline,
      height: height?.toDouble(),
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness?.toDouble(),
      debugLabel: debugLabel,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: package,
    ),
);
