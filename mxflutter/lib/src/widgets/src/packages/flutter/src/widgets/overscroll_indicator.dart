//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/widgets/overscroll_indicator.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/notification_listener.dart';
import 'package:flutter/src/widgets/scroll_notification.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerOverscrollIndicatorSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_glowingOverscrollIndicator.funName] = _glowingOverscrollIndicator;
  m[_overscrollIndicatorNotification.funName] = _overscrollIndicatorNotification;
  return m;
}
var _glowingOverscrollIndicator = MXFunctionInvoke(
    "GlowingOverscrollIndicator",
    (
      {
      Key key,
      bool showLeading = true,
      bool showTrailing = true,
      AxisDirection axisDirection,
      Color color,
      dynamic notificationPredicate,
      Widget child,
      }
    ) =>
      GlowingOverscrollIndicator(
      key: key,
      showLeading: showLeading,
      showTrailing: showTrailing,
      axisDirection: axisDirection,
      color: color,
      notificationPredicate: null,
      child: child,
    ),
);
var _overscrollIndicatorNotification = MXFunctionInvoke(
    "OverscrollIndicatorNotification",
    (
      {
      bool leading,
      }
    ) =>
      OverscrollIndicatorNotification(
      leading: leading,
    ),
);
