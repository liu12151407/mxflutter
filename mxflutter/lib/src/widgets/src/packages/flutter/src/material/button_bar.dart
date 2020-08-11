//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/material/button_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/material/button_bar_theme.dart';
import 'package:flutter/src/material/button_theme.dart';
import 'package:flutter/src/material/dialog.dart';
import 'package:flutter/src/material/flat_button.dart';
import 'package:flutter/src/material/raised_button.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerButtonBarSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_buttonBar.funName] = _buttonBar;
  return m;
}
var _buttonBar = MXFunctionInvoke(
    "ButtonBar",
    (
      {
      Key key,
      MainAxisAlignment alignment,
      MainAxisSize mainAxisSize,
      ButtonTextTheme buttonTextTheme,
      dynamic buttonMinWidth,
      dynamic buttonHeight,
      EdgeInsetsGeometry buttonPadding,
      bool buttonAlignedDropdown,
      ButtonBarLayoutBehavior layoutBehavior,
      VerticalDirection overflowDirection,
      dynamic overflowButtonSpacing,
      dynamic children = const <Widget>[],
      }
    ) =>
      ButtonBar(
      key: key,
      alignment: alignment,
      mainAxisSize: mainAxisSize,
      buttonTextTheme: buttonTextTheme,
      buttonMinWidth: buttonMinWidth?.toDouble(),
      buttonHeight: buttonHeight?.toDouble(),
      buttonPadding: buttonPadding,
      buttonAlignedDropdown: buttonAlignedDropdown,
      layoutBehavior: layoutBehavior,
      overflowDirection: overflowDirection,
      overflowButtonSpacing: overflowButtonSpacing?.toDouble(),
      children: toListT<Widget>(children),
    ),
);
