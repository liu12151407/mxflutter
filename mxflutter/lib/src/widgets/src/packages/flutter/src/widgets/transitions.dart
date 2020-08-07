//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/widgets/transitions.dart';
import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/text.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerTransitionsSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_slideTransition.funName] = _slideTransition;
  m[_scaleTransition.funName] = _scaleTransition;
  m[_rotationTransition.funName] = _rotationTransition;
  m[_sizeTransition.funName] = _sizeTransition;
  m[_fadeTransition.funName] = _fadeTransition;
  m[_sliverFadeTransition.funName] = _sliverFadeTransition;
  m[_relativeRectTween.funName] = _relativeRectTween;
  m[_positionedTransition.funName] = _positionedTransition;
  m[_relativePositionedTransition.funName] = _relativePositionedTransition;
  m[_decoratedBoxTransition.funName] = _decoratedBoxTransition;
  m[_alignTransition.funName] = _alignTransition;
  m[_defaultTextStyleTransition.funName] = _defaultTextStyleTransition;
  m[_animatedBuilder.funName] = _animatedBuilder;
  return m;
}
var _slideTransition = MXFunctionInvoke(
    "SlideTransition",
    (
      {
      Key key,
      Animation<Offset> position,
      bool transformHitTests = true,
      TextDirection textDirection,
      Widget child,
      }
    ) =>
      SlideTransition(
      key: key,
      position: position,
      transformHitTests: transformHitTests,
      textDirection: textDirection,
      child: child,
    ),
);
var _scaleTransition = MXFunctionInvoke(
    "ScaleTransition",
    (
      {
      Key key,
      Animation<double> scale,
      Alignment alignment,
      Widget child,
      }
    ) =>
      ScaleTransition(
      key: key,
      scale: scale,
      alignment: alignment,
      child: child,
    ),
);
var _rotationTransition = MXFunctionInvoke(
    "RotationTransition",
    (
      {
      Key key,
      Animation<double> turns,
      Alignment alignment,
      Widget child,
      }
    ) =>
      RotationTransition(
      key: key,
      turns: turns,
      alignment: alignment,
      child: child,
    ),
);
var _sizeTransition = MXFunctionInvoke(
    "SizeTransition",
    (
      {
      Key key,
      Axis axis = Axis.vertical,
      Animation<double> sizeFactor,
      dynamic axisAlignment = 0.0,
      Widget child,
      }
    ) =>
      SizeTransition(
      key: key,
      axis: axis,
      sizeFactor: sizeFactor,
      axisAlignment: axisAlignment?.toDouble(),
      child: child,
    ),
);
var _fadeTransition = MXFunctionInvoke(
    "FadeTransition",
    (
      {
      Key key,
      Animation<double> opacity,
      bool alwaysIncludeSemantics = false,
      Widget child,
      }
    ) =>
      FadeTransition(
      key: key,
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      child: child,
    ),
);
var _sliverFadeTransition = MXFunctionInvoke(
    "SliverFadeTransition",
    (
      {
      Key key,
      Animation<double> opacity,
      bool alwaysIncludeSemantics = false,
      Widget sliver,
      }
    ) =>
      SliverFadeTransition(
      key: key,
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      sliver: sliver,
    ),
);
var _relativeRectTween = MXFunctionInvoke(
    "RelativeRectTween",
    (
      {
      RelativeRect begin,
      RelativeRect end,
      }
    ) =>
      RelativeRectTween(
      begin: begin,
      end: end,
    ),
);
var _positionedTransition = MXFunctionInvoke(
    "PositionedTransition",
    (
      {
      Key key,
      Animation<RelativeRect> rect,
      Widget child,
      }
    ) =>
      PositionedTransition(
      key: key,
      rect: rect,
      child: child,
    ),
);
var _relativePositionedTransition = MXFunctionInvoke(
    "RelativePositionedTransition",
    (
      {
      Key key,
      Animation<Rect> rect,
      Size size,
      Widget child,
      }
    ) =>
      RelativePositionedTransition(
      key: key,
      rect: rect,
      size: size,
      child: child,
    ),
);
var _decoratedBoxTransition = MXFunctionInvoke(
    "DecoratedBoxTransition",
    (
      {
      Key key,
      Animation<Decoration> decoration,
      DecorationPosition position = DecorationPosition.background,
      Widget child,
      }
    ) =>
      DecoratedBoxTransition(
      key: key,
      decoration: decoration,
      position: position,
      child: child,
    ),
);
var _alignTransition = MXFunctionInvoke(
    "AlignTransition",
    (
      {
      Key key,
      Animation<AlignmentGeometry> alignment,
      Widget child,
      dynamic widthFactor,
      dynamic heightFactor,
      }
    ) =>
      AlignTransition(
      key: key,
      alignment: alignment,
      child: child,
      widthFactor: widthFactor?.toDouble(),
      heightFactor: heightFactor?.toDouble(),
    ),
);
var _defaultTextStyleTransition = MXFunctionInvoke(
    "DefaultTextStyleTransition",
    (
      {
      Key key,
      Animation<TextStyle> style,
      Widget child,
      TextAlign textAlign,
      bool softWrap = true,
      TextOverflow overflow = TextOverflow.clip,
      int maxLines,
      }
    ) =>
      DefaultTextStyleTransition(
      key: key,
      style: style,
      child: child,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    ),
);
var _animatedBuilder = MXFunctionInvoke(
    "AnimatedBuilder",
    (
      {
      Key key,
      Listenable animation,
      dynamic builder,
      Widget child,
      }
    ) =>
      AnimatedBuilder(
      key: key,
      animation: animation,
      builder: null,
      child: child,
    ),
);
