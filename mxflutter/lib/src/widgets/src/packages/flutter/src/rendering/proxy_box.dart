//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/rendering/proxy_box.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/semantics.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/src/rendering/binding.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/src/rendering/layer.dart';
import 'package:flutter/src/rendering/mouse_tracking.dart';
import 'package:flutter/src/rendering/object.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerProxyBoxSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_renderProxyBox.funName] = _renderProxyBox;
  m[_hitTestBehavior.funName] = _hitTestBehavior;
  m[_renderConstrainedBox.funName] = _renderConstrainedBox;
  m[_renderLimitedBox.funName] = _renderLimitedBox;
  m[_renderAspectRatio.funName] = _renderAspectRatio;
  m[_renderIntrinsicWidth.funName] = _renderIntrinsicWidth;
  m[_renderIntrinsicHeight.funName] = _renderIntrinsicHeight;
  m[_renderOpacity.funName] = _renderOpacity;
  m[_renderAnimatedOpacity.funName] = _renderAnimatedOpacity;
  m[_renderShaderMask.funName] = _renderShaderMask;
  m[_renderBackdropFilter.funName] = _renderBackdropFilter;
  m[_shapeBorderClipper.funName] = _shapeBorderClipper;
  m[_renderClipRect.funName] = _renderClipRect;
  m[_renderClipRRect.funName] = _renderClipRRect;
  m[_renderClipOval.funName] = _renderClipOval;
  m[_renderClipPath.funName] = _renderClipPath;
  m[_renderPhysicalModel.funName] = _renderPhysicalModel;
  m[_renderPhysicalShape.funName] = _renderPhysicalShape;
  m[_decorationPosition.funName] = _decorationPosition;
  m[_renderDecoratedBox.funName] = _renderDecoratedBox;
  m[_renderTransform.funName] = _renderTransform;
  m[_renderFittedBox.funName] = _renderFittedBox;
  m[_renderFractionalTranslation.funName] = _renderFractionalTranslation;
  m[_renderPointerListener.funName] = _renderPointerListener;
  m[_renderMouseRegion.funName] = _renderMouseRegion;
  m[_renderRepaintBoundary.funName] = _renderRepaintBoundary;
  m[_renderIgnorePointer.funName] = _renderIgnorePointer;
  m[_renderOffstage.funName] = _renderOffstage;
  m[_renderAbsorbPointer.funName] = _renderAbsorbPointer;
  m[_renderMetaData.funName] = _renderMetaData;
  m[_renderSemanticsGestureHandler.funName] = _renderSemanticsGestureHandler;
  m[_renderSemanticsAnnotations.funName] = _renderSemanticsAnnotations;
  m[_renderBlockSemantics.funName] = _renderBlockSemantics;
  m[_renderMergeSemantics.funName] = _renderMergeSemantics;
  m[_renderExcludeSemantics.funName] = _renderExcludeSemantics;
  m[_renderIndexedSemantics.funName] = _renderIndexedSemantics;
  m[_renderLeaderLayer.funName] = _renderLeaderLayer;
  m[_renderFollowerLayer.funName] = _renderFollowerLayer;
  m[_renderAnnotatedRegion.funName] = _renderAnnotatedRegion;
  return m;
}
var _renderProxyBox = MXFunctionInvoke(
    "RenderProxyBox",
    (
      {
      RenderBox child,
      }
    ) =>
      RenderProxyBox(
      child,
    ),
);
var _hitTestBehavior = MXFunctionInvoke(
    "HitTestBehavior",
    ({Map args}) => MXHitTestBehavior.parse(args),
  );
var _renderConstrainedBox = MXFunctionInvoke(
    "RenderConstrainedBox",
    (
      {
      RenderBox child,
      BoxConstraints additionalConstraints,
      }
    ) =>
      RenderConstrainedBox(
      child: child,
      additionalConstraints: additionalConstraints,
    ),
);
var _renderLimitedBox = MXFunctionInvoke(
    "RenderLimitedBox",
    (
      {
      RenderBox child,
      dynamic maxWidth = double.infinity,
      dynamic maxHeight = double.infinity,
      }
    ) =>
      RenderLimitedBox(
      child: child,
      maxWidth: maxWidth?.toDouble(),
      maxHeight: maxHeight?.toDouble(),
    ),
);
var _renderAspectRatio = MXFunctionInvoke(
    "RenderAspectRatio",
    (
      {
      RenderBox child,
      dynamic aspectRatio,
      }
    ) =>
      RenderAspectRatio(
      child: child,
      aspectRatio: aspectRatio?.toDouble(),
    ),
);
var _renderIntrinsicWidth = MXFunctionInvoke(
    "RenderIntrinsicWidth",
    (
      {
      dynamic stepWidth,
      dynamic stepHeight,
      RenderBox child,
      }
    ) =>
      RenderIntrinsicWidth(
      stepWidth: stepWidth?.toDouble(),
      stepHeight: stepHeight?.toDouble(),
      child: child,
    ),
);
var _renderIntrinsicHeight = MXFunctionInvoke(
    "RenderIntrinsicHeight",
    (
      {
      RenderBox child,
      }
    ) =>
      RenderIntrinsicHeight(
      child: child,
    ),
);
var _renderOpacity = MXFunctionInvoke(
    "RenderOpacity",
    (
      {
      dynamic opacity = 1.0,
      bool alwaysIncludeSemantics = false,
      RenderBox child,
      }
    ) =>
      RenderOpacity(
      opacity: opacity?.toDouble(),
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      child: child,
    ),
);
var _renderAnimatedOpacity = MXFunctionInvoke(
    "RenderAnimatedOpacity",
    (
      {
      Animation<double> opacity,
      bool alwaysIncludeSemantics = false,
      RenderBox child,
      }
    ) =>
      RenderAnimatedOpacity(
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      child: child,
    ),
);
var _renderShaderMask = MXFunctionInvoke(
    "RenderShaderMask",
    (
      {
      RenderBox child,
      dynamic shaderCallback,
      BlendMode blendMode = BlendMode.modulate,
      }
    ) =>
      RenderShaderMask(
      child: child,
      shaderCallback: null,
      blendMode: blendMode,
    ),
);
var _renderBackdropFilter = MXFunctionInvoke(
    "RenderBackdropFilter",
    (
      {
      RenderBox child,
      ImageFilter filter,
      }
    ) =>
      RenderBackdropFilter(
      child: child,
      filter: filter,
    ),
);
var _shapeBorderClipper = MXFunctionInvoke(
    "ShapeBorderClipper",
    (
      {
      ShapeBorder shape,
      TextDirection textDirection,
      }
    ) =>
      ShapeBorderClipper(
      shape: shape,
      textDirection: textDirection,
    ),
);
var _renderClipRect = MXFunctionInvoke(
    "RenderClipRect",
    (
      {
      RenderBox child,
      CustomClipper<Rect> clipper,
      Clip clipBehavior = Clip.antiAlias,
      }
    ) =>
      RenderClipRect(
      child: child,
      clipper: clipper,
      clipBehavior: clipBehavior,
    ),
);
var _renderClipRRect = MXFunctionInvoke(
    "RenderClipRRect",
    (
      {
      RenderBox child,
      BorderRadius borderRadius,
      CustomClipper<RRect> clipper,
      Clip clipBehavior = Clip.antiAlias,
      }
    ) =>
      RenderClipRRect(
      child: child,
      borderRadius: borderRadius,
      clipper: clipper,
      clipBehavior: clipBehavior,
    ),
);
var _renderClipOval = MXFunctionInvoke(
    "RenderClipOval",
    (
      {
      RenderBox child,
      CustomClipper<Rect> clipper,
      Clip clipBehavior = Clip.antiAlias,
      }
    ) =>
      RenderClipOval(
      child: child,
      clipper: clipper,
      clipBehavior: clipBehavior,
    ),
);
var _renderClipPath = MXFunctionInvoke(
    "RenderClipPath",
    (
      {
      RenderBox child,
      CustomClipper<Path> clipper,
      Clip clipBehavior = Clip.antiAlias,
      }
    ) =>
      RenderClipPath(
      child: child,
      clipper: clipper,
      clipBehavior: clipBehavior,
    ),
);
var _renderPhysicalModel = MXFunctionInvoke(
    "RenderPhysicalModel",
    (
      {
      RenderBox child,
      BoxShape shape = BoxShape.rectangle,
      Clip clipBehavior = Clip.none,
      BorderRadius borderRadius,
      dynamic elevation = 0.0,
      Color color,
      Color shadowColor,
      }
    ) =>
      RenderPhysicalModel(
      child: child,
      shape: shape,
      clipBehavior: clipBehavior,
      borderRadius: borderRadius,
      elevation: elevation?.toDouble(),
      color: color,
      shadowColor: shadowColor,
    ),
);
var _renderPhysicalShape = MXFunctionInvoke(
    "RenderPhysicalShape",
    (
      {
      RenderBox child,
      CustomClipper<Path> clipper,
      Clip clipBehavior = Clip.none,
      dynamic elevation = 0.0,
      Color color,
      Color shadowColor,
      }
    ) =>
      RenderPhysicalShape(
      child: child,
      clipper: clipper,
      clipBehavior: clipBehavior,
      elevation: elevation?.toDouble(),
      color: color,
      shadowColor: shadowColor,
    ),
);
var _decorationPosition = MXFunctionInvoke(
    "DecorationPosition",
    ({Map args}) => MXDecorationPosition.parse(args),
  );
var _renderDecoratedBox = MXFunctionInvoke(
    "RenderDecoratedBox",
    (
      {
      Decoration decoration,
      DecorationPosition position = DecorationPosition.background,
      ImageConfiguration configuration,
      RenderBox child,
      }
    ) =>
      RenderDecoratedBox(
      decoration: decoration,
      position: position,
      configuration: configuration,
      child: child,
    ),
);
var _renderTransform = MXFunctionInvoke(
    "RenderTransform",
    (
      {
      Matrix4 transform,
      Offset origin,
      AlignmentGeometry alignment,
      TextDirection textDirection,
      bool transformHitTests = true,
      RenderBox child,
      }
    ) =>
      RenderTransform(
      transform: transform,
      origin: origin,
      alignment: alignment,
      textDirection: textDirection,
      transformHitTests: transformHitTests,
      child: child,
    ),
);
var _renderFittedBox = MXFunctionInvoke(
    "RenderFittedBox",
    (
      {
      BoxFit fit = BoxFit.contain,
      AlignmentGeometry alignment,
      TextDirection textDirection,
      RenderBox child,
      }
    ) =>
      RenderFittedBox(
      fit: fit,
      alignment: alignment,
      textDirection: textDirection,
      child: child,
    ),
);
var _renderFractionalTranslation = MXFunctionInvoke(
    "RenderFractionalTranslation",
    (
      {
      Offset translation,
      bool transformHitTests = true,
      RenderBox child,
      }
    ) =>
      RenderFractionalTranslation(
      translation: translation,
      transformHitTests: transformHitTests,
      child: child,
    ),
);
var _renderPointerListener = MXFunctionInvoke(
    "RenderPointerListener",
    (
      {
      dynamic onPointerDown,
      dynamic onPointerMove,
      dynamic onPointerUp,
      dynamic onPointerCancel,
      dynamic onPointerSignal,
      HitTestBehavior behavior = HitTestBehavior.deferToChild,
      RenderBox child,
      }
    ) =>
      RenderPointerListener(
      onPointerDown: createValueChangedGenericClosure<PointerDownEvent>(_renderPointerListener.buildOwner, onPointerDown),
      onPointerMove: createValueChangedGenericClosure<PointerMoveEvent>(_renderPointerListener.buildOwner, onPointerMove),
      onPointerUp: createValueChangedGenericClosure<PointerUpEvent>(_renderPointerListener.buildOwner, onPointerUp),
      onPointerCancel: createValueChangedGenericClosure<PointerCancelEvent>(_renderPointerListener.buildOwner, onPointerCancel),
      onPointerSignal: createValueChangedGenericClosure<PointerSignalEvent>(_renderPointerListener.buildOwner, onPointerSignal),
      behavior: behavior,
      child: child,
    ),
);
var _renderMouseRegion = MXFunctionInvoke(
    "RenderMouseRegion",
    (
      {
      dynamic onEnter,
      dynamic onHover,
      dynamic onExit,
      bool opaque = true,
      RenderBox child,
      }
    ) =>
      RenderMouseRegion(
      onEnter: createValueChangedGenericClosure<PointerEnterEvent>(_renderMouseRegion.buildOwner, onEnter),
      onHover: createValueChangedGenericClosure<PointerHoverEvent>(_renderMouseRegion.buildOwner, onHover),
      onExit: createValueChangedGenericClosure<PointerExitEvent>(_renderMouseRegion.buildOwner, onExit),
      opaque: opaque,
      child: child,
    ),
);
var _renderRepaintBoundary = MXFunctionInvoke(
    "RenderRepaintBoundary",
    (
      {
      RenderBox child,
      }
    ) =>
      RenderRepaintBoundary(
      child: child,
    ),
);
var _renderIgnorePointer = MXFunctionInvoke(
    "RenderIgnorePointer",
    (
      {
      RenderBox child,
      bool ignoring = true,
      bool ignoringSemantics,
      }
    ) =>
      RenderIgnorePointer(
      child: child,
      ignoring: ignoring,
      ignoringSemantics: ignoringSemantics,
    ),
);
var _renderOffstage = MXFunctionInvoke(
    "RenderOffstage",
    (
      {
      bool offstage = true,
      RenderBox child,
      }
    ) =>
      RenderOffstage(
      offstage: offstage,
      child: child,
    ),
);
var _renderAbsorbPointer = MXFunctionInvoke(
    "RenderAbsorbPointer",
    (
      {
      RenderBox child,
      bool absorbing = true,
      bool ignoringSemantics,
      }
    ) =>
      RenderAbsorbPointer(
      child: child,
      absorbing: absorbing,
      ignoringSemantics: ignoringSemantics,
    ),
);
var _renderMetaData = MXFunctionInvoke(
    "RenderMetaData",
    (
      {
      dynamic metaData,
      HitTestBehavior behavior = HitTestBehavior.deferToChild,
      RenderBox child,
      }
    ) =>
      RenderMetaData(
      metaData: metaData,
      behavior: behavior,
      child: child,
    ),
);
var _renderSemanticsGestureHandler = MXFunctionInvoke(
    "RenderSemanticsGestureHandler",
    (
      {
      RenderBox child,
      dynamic onTap,
      dynamic onLongPress,
      dynamic onHorizontalDragUpdate,
      dynamic onVerticalDragUpdate,
      dynamic scrollFactor = 0.8,
      }
    ) =>
      RenderSemanticsGestureHandler(
      child: child,
      onTap: createVoidCallbackClosure(_renderSemanticsGestureHandler.buildOwner, onTap),
      onLongPress: createVoidCallbackClosure(_renderSemanticsGestureHandler.buildOwner, onLongPress),
      onHorizontalDragUpdate: createValueChangedGenericClosure<DragUpdateDetails>(_renderSemanticsGestureHandler.buildOwner, onHorizontalDragUpdate),
      onVerticalDragUpdate: createValueChangedGenericClosure<DragUpdateDetails>(_renderSemanticsGestureHandler.buildOwner, onVerticalDragUpdate),
      scrollFactor: scrollFactor?.toDouble(),
    ),
);
var _renderSemanticsAnnotations = MXFunctionInvoke(
    "RenderSemanticsAnnotations",
    (
      {
      RenderBox child,
      bool container = false,
      bool explicitChildNodes,
      bool excludeSemantics = false,
      bool enabled,
      bool checked,
      bool toggled,
      bool selected,
      bool button,
      bool link,
      bool header,
      bool textField,
      bool readOnly,
      bool focusable,
      bool focused,
      bool inMutuallyExclusiveGroup,
      bool obscured,
      bool multiline,
      bool scopesRoute,
      bool namesRoute,
      bool hidden,
      bool image,
      bool liveRegion,
      int maxValueLength,
      int currentValueLength,
      String label,
      String value,
      String increasedValue,
      String decreasedValue,
      String hint,
      SemanticsHintOverrides hintOverrides,
      TextDirection textDirection,
      SemanticsSortKey sortKey,
      dynamic onTap,
      dynamic onDismiss,
      dynamic onLongPress,
      dynamic onScrollLeft,
      dynamic onScrollRight,
      dynamic onScrollUp,
      dynamic onScrollDown,
      dynamic onIncrease,
      dynamic onDecrease,
      dynamic onCopy,
      dynamic onCut,
      dynamic onPaste,
      dynamic onMoveCursorForwardByCharacter,
      dynamic onMoveCursorBackwardByCharacter,
      dynamic onMoveCursorForwardByWord,
      dynamic onMoveCursorBackwardByWord,
      dynamic onSetSelection,
      dynamic onDidGainAccessibilityFocus,
      dynamic onDidLoseAccessibilityFocus,
      Map<CustomSemanticsAction, void Function()> customSemanticsActions,
      }
    ) =>
      RenderSemanticsAnnotations(
      child: child,
      container: container,
      explicitChildNodes: explicitChildNodes,
      excludeSemantics: excludeSemantics,
      enabled: enabled,
      checked: checked,
      toggled: toggled,
      selected: selected,
      button: button,
      link: link,
      header: header,
      textField: textField,
      readOnly: readOnly,
      focusable: focusable,
      focused: focused,
      inMutuallyExclusiveGroup: inMutuallyExclusiveGroup,
      obscured: obscured,
      multiline: multiline,
      scopesRoute: scopesRoute,
      namesRoute: namesRoute,
      hidden: hidden,
      image: image,
      liveRegion: liveRegion,
      maxValueLength: maxValueLength,
      currentValueLength: currentValueLength,
      label: label,
      value: value,
      increasedValue: increasedValue,
      decreasedValue: decreasedValue,
      hint: hint,
      hintOverrides: hintOverrides,
      textDirection: textDirection,
      sortKey: sortKey,
      onTap: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onTap),
      onDismiss: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onDismiss),
      onLongPress: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onLongPress),
      onScrollLeft: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onScrollLeft),
      onScrollRight: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onScrollRight),
      onScrollUp: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onScrollUp),
      onScrollDown: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onScrollDown),
      onIncrease: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onIncrease),
      onDecrease: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onDecrease),
      onCopy: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onCopy),
      onCut: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onCut),
      onPaste: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onPaste),
      onMoveCursorForwardByCharacter: createValueChangedGenericClosure<bool>(_renderSemanticsAnnotations.buildOwner, onMoveCursorForwardByCharacter),
      onMoveCursorBackwardByCharacter: createValueChangedGenericClosure<bool>(_renderSemanticsAnnotations.buildOwner, onMoveCursorBackwardByCharacter),
      onMoveCursorForwardByWord: createValueChangedGenericClosure<bool>(_renderSemanticsAnnotations.buildOwner, onMoveCursorForwardByWord),
      onMoveCursorBackwardByWord: createValueChangedGenericClosure<bool>(_renderSemanticsAnnotations.buildOwner, onMoveCursorBackwardByWord),
      onSetSelection: createValueChangedGenericClosure<TextSelection>(_renderSemanticsAnnotations.buildOwner, onSetSelection),
      onDidGainAccessibilityFocus: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onDidGainAccessibilityFocus),
      onDidLoseAccessibilityFocus: createVoidCallbackClosure(_renderSemanticsAnnotations.buildOwner, onDidLoseAccessibilityFocus),
      customSemanticsActions: customSemanticsActions,
    ),
);
var _renderBlockSemantics = MXFunctionInvoke(
    "RenderBlockSemantics",
    (
      {
      RenderBox child,
      bool blocking = true,
      }
    ) =>
      RenderBlockSemantics(
      child: child,
      blocking: blocking,
    ),
);
var _renderMergeSemantics = MXFunctionInvoke(
    "RenderMergeSemantics",
    (
      {
      RenderBox child,
      }
    ) =>
      RenderMergeSemantics(
      child: child,
    ),
);
var _renderExcludeSemantics = MXFunctionInvoke(
    "RenderExcludeSemantics",
    (
      {
      RenderBox child,
      bool excluding = true,
      }
    ) =>
      RenderExcludeSemantics(
      child: child,
      excluding: excluding,
    ),
);
var _renderIndexedSemantics = MXFunctionInvoke(
    "RenderIndexedSemantics",
    (
      {
      RenderBox child,
      int index,
      }
    ) =>
      RenderIndexedSemantics(
      child: child,
      index: index,
    ),
);
var _renderLeaderLayer = MXFunctionInvoke(
    "RenderLeaderLayer",
    (
      {
      LayerLink link,
      RenderBox child,
      }
    ) =>
      RenderLeaderLayer(
      link: link,
      child: child,
    ),
);
var _renderFollowerLayer = MXFunctionInvoke(
    "RenderFollowerLayer",
    (
      {
      LayerLink link,
      bool showWhenUnlinked = true,
      Offset offset,
      RenderBox child,
      }
    ) =>
      RenderFollowerLayer(
      link: link,
      showWhenUnlinked: showWhenUnlinked,
      offset: offset,
      child: child,
    ),
);
var _renderAnnotatedRegion = MXFunctionInvoke(
    "RenderAnnotatedRegion",
    (
      {
      dynamic value,
      bool sized,
      RenderBox child,
      }
    ) =>
      RenderAnnotatedRegion(
      value: value,
      sized: sized,
      child: child,
    ),
);
class MXHitTestBehavior {
  static Map str2VMap = {
    'HitTestBehavior.deferToChild': HitTestBehavior.deferToChild,
    'HitTestBehavior.opaque': HitTestBehavior.opaque,
    'HitTestBehavior.translucent': HitTestBehavior.translucent,
  };
  static HitTestBehavior parse(dynamic value) {
    if (value is Map) {
      var valueStr = value["_name"].trim();
      var v = str2VMap[valueStr];
      return v;
    } else {
      return value;
    }
  }
}
class MXDecorationPosition {
  static Map str2VMap = {
    'DecorationPosition.background': DecorationPosition.background,
    'DecorationPosition.foreground': DecorationPosition.foreground,
  };
  static DecorationPosition parse(dynamic value) {
    if (value is Map) {
      var valueStr = value["_name"].trim();
      var v = str2VMap[valueStr];
      return v;
    } else {
      return value;
    }
  }
}
