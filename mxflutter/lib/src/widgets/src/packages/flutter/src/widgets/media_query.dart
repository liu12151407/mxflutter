//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/widgets/media_query.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerMediaQuerySeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_orientation.funName] = _orientation;
  m[_mediaQueryData.funName] = _mediaQueryData;
  m[_mediaQueryData_fromWindow.funName] = _mediaQueryData_fromWindow;
  m[_mediaQuery.funName] = _mediaQuery;
  m[_mediaQuery_removePadding.funName] = _mediaQuery_removePadding;
  m[_mediaQuery_removeViewInsets.funName] = _mediaQuery_removeViewInsets;
  m[_mediaQuery_removeViewPadding.funName] = _mediaQuery_removeViewPadding;
  return m;
}
var _orientation = MXFunctionInvoke(
    "Orientation",
    ({Map args}) => MXOrientation.parse(args),
  );
var _mediaQueryData = MXFunctionInvoke(
    "MediaQueryData",
    (
      {
      Size size,
      dynamic devicePixelRatio = 1.0,
      dynamic textScaleFactor = 1.0,
      Brightness platformBrightness = Brightness.light,
      EdgeInsets padding,
      EdgeInsets viewInsets,
      EdgeInsets systemGestureInsets,
      EdgeInsets viewPadding,
      dynamic physicalDepth = 1.7976931348623157e+308,
      bool alwaysUse24HourFormat = false,
      bool accessibleNavigation = false,
      bool invertColors = false,
      bool highContrast = false,
      bool disableAnimations = false,
      bool boldText = false,
      }
    ) =>
      MediaQueryData(
      size: size,
      devicePixelRatio: devicePixelRatio?.toDouble(),
      textScaleFactor: textScaleFactor?.toDouble(),
      platformBrightness: platformBrightness,
      padding: padding,
      viewInsets: viewInsets,
      systemGestureInsets: systemGestureInsets,
      viewPadding: viewPadding,
      physicalDepth: physicalDepth?.toDouble(),
      alwaysUse24HourFormat: alwaysUse24HourFormat,
      accessibleNavigation: accessibleNavigation,
      invertColors: invertColors,
      highContrast: highContrast,
      disableAnimations: disableAnimations,
      boldText: boldText,
    ),
);
var _mediaQueryData_fromWindow = MXFunctionInvoke(
  "MediaQueryData.fromWindow",
    (
      {
      Window window,
      }
    ) =>
      MediaQueryData.fromWindow(
      window,
    ),
);
var _mediaQuery = MXFunctionInvoke(
    "MediaQuery",
    (
      {
      Key key,
      MediaQueryData data,
      Widget child,
      }
    ) =>
      MediaQuery(
      key: key,
      data: data,
      child: child,
    ),
);
var _mediaQuery_removePadding = MXFunctionInvoke(
  "MediaQuery.removePadding",
    (
      {
      Key key,
      BuildContext context,
      bool removeLeft = false,
      bool removeTop = false,
      bool removeRight = false,
      bool removeBottom = false,
      Widget child,
      }
    ) =>
      MediaQuery.removePadding(
      key: key,
      context: context,
      removeLeft: removeLeft,
      removeTop: removeTop,
      removeRight: removeRight,
      removeBottom: removeBottom,
      child: child,
    ),
);
var _mediaQuery_removeViewInsets = MXFunctionInvoke(
  "MediaQuery.removeViewInsets",
    (
      {
      Key key,
      BuildContext context,
      bool removeLeft = false,
      bool removeTop = false,
      bool removeRight = false,
      bool removeBottom = false,
      Widget child,
      }
    ) =>
      MediaQuery.removeViewInsets(
      key: key,
      context: context,
      removeLeft: removeLeft,
      removeTop: removeTop,
      removeRight: removeRight,
      removeBottom: removeBottom,
      child: child,
    ),
);
var _mediaQuery_removeViewPadding = MXFunctionInvoke(
  "MediaQuery.removeViewPadding",
    (
      {
      Key key,
      BuildContext context,
      bool removeLeft = false,
      bool removeTop = false,
      bool removeRight = false,
      bool removeBottom = false,
      Widget child,
      }
    ) =>
      MediaQuery.removeViewPadding(
      key: key,
      context: context,
      removeLeft: removeLeft,
      removeTop: removeTop,
      removeRight: removeRight,
      removeBottom: removeBottom,
      child: child,
    ),
);
class MXOrientation {
  static Map str2VMap = {
    'Orientation.portrait': Orientation.portrait,
    'Orientation.landscape': Orientation.landscape,
  };
  static Orientation parse(dynamic value) {
    if (value is Map) {
      var valueStr = value["_name"].trim();
      var v = str2VMap[valueStr];
      return v;
    } else {
      return value;
    }
  }
}
