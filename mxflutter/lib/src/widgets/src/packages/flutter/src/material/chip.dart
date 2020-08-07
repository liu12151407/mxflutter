//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/material/chip.dart';
import 'dart:math' as math;
import 'package:flutter/gestures.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/chip_theme.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/material/constants.dart';
import 'package:flutter/src/material/debug.dart';
import 'package:flutter/src/material/feedback.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/ink_well.dart';
import 'package:flutter/src/material/material.dart';
import 'package:flutter/src/material/material_localizations.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/material/tooltip.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerChipSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_chip.funName] = _chip;
  m[_inputChip.funName] = _inputChip;
  m[_choiceChip.funName] = _choiceChip;
  m[_filterChip.funName] = _filterChip;
  m[_actionChip.funName] = _actionChip;
  m[_rawChip.funName] = _rawChip;
  return m;
}
var _chip = MXFunctionInvoke(
    "Chip",
    (
      {
      Key key,
      Widget avatar,
      Widget label,
      TextStyle labelStyle,
      EdgeInsetsGeometry labelPadding,
      Widget deleteIcon,
      dynamic onDeleted,
      Color deleteIconColor,
      String deleteButtonTooltipMessage,
      ShapeBorder shape,
      Clip clipBehavior = Clip.none,
      FocusNode focusNode,
      bool autofocus = false,
      Color backgroundColor,
      EdgeInsetsGeometry padding,
      VisualDensity visualDensity,
      MaterialTapTargetSize materialTapTargetSize,
      dynamic elevation,
      Color shadowColor,
      }
    ) =>
      Chip(
      key: key,
      avatar: avatar,
      label: label,
      labelStyle: labelStyle,
      labelPadding: labelPadding,
      deleteIcon: deleteIcon,
      onDeleted: createVoidCallbackClosure(_chip.buildOwner, onDeleted),
      deleteIconColor: deleteIconColor,
      deleteButtonTooltipMessage: deleteButtonTooltipMessage,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      backgroundColor: backgroundColor,
      padding: padding,
      visualDensity: visualDensity,
      materialTapTargetSize: materialTapTargetSize,
      elevation: elevation?.toDouble(),
      shadowColor: shadowColor,
    ),
);
var _inputChip = MXFunctionInvoke(
    "InputChip",
    (
      {
      Key key,
      Widget avatar,
      Widget label,
      TextStyle labelStyle,
      EdgeInsetsGeometry labelPadding,
      bool selected = false,
      bool isEnabled = true,
      dynamic onSelected,
      Widget deleteIcon,
      dynamic onDeleted,
      Color deleteIconColor,
      String deleteButtonTooltipMessage,
      dynamic onPressed,
      dynamic pressElevation,
      Color disabledColor,
      Color selectedColor,
      String tooltip,
      ShapeBorder shape,
      Clip clipBehavior = Clip.none,
      FocusNode focusNode,
      bool autofocus = false,
      Color backgroundColor,
      EdgeInsetsGeometry padding,
      VisualDensity visualDensity,
      MaterialTapTargetSize materialTapTargetSize,
      dynamic elevation,
      Color shadowColor,
      Color selectedShadowColor,
      bool showCheckmark,
      Color checkmarkColor,
      ShapeBorder avatarBorder,
      }
    ) =>
      InputChip(
      key: key,
      avatar: avatar,
      label: label,
      labelStyle: labelStyle,
      labelPadding: labelPadding,
      selected: selected,
      isEnabled: isEnabled,
      onSelected: createValueChangedGenericClosure<bool>(_inputChip.buildOwner, onSelected),
      deleteIcon: deleteIcon,
      onDeleted: createVoidCallbackClosure(_inputChip.buildOwner, onDeleted),
      deleteIconColor: deleteIconColor,
      deleteButtonTooltipMessage: deleteButtonTooltipMessage,
      onPressed: createVoidCallbackClosure(_inputChip.buildOwner, onPressed),
      pressElevation: pressElevation?.toDouble(),
      disabledColor: disabledColor,
      selectedColor: selectedColor,
      tooltip: tooltip,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      backgroundColor: backgroundColor,
      padding: padding,
      visualDensity: visualDensity,
      materialTapTargetSize: materialTapTargetSize,
      elevation: elevation?.toDouble(),
      shadowColor: shadowColor,
      selectedShadowColor: selectedShadowColor,
      showCheckmark: showCheckmark,
      checkmarkColor: checkmarkColor,
      avatarBorder: avatarBorder,
    ),
);
var _choiceChip = MXFunctionInvoke(
    "ChoiceChip",
    (
      {
      Key key,
      Widget avatar,
      Widget label,
      TextStyle labelStyle,
      EdgeInsetsGeometry labelPadding,
      dynamic onSelected,
      dynamic pressElevation,
      bool selected,
      Color selectedColor,
      Color disabledColor,
      String tooltip,
      ShapeBorder shape,
      Clip clipBehavior = Clip.none,
      FocusNode focusNode,
      bool autofocus = false,
      Color backgroundColor,
      EdgeInsetsGeometry padding,
      VisualDensity visualDensity,
      MaterialTapTargetSize materialTapTargetSize,
      dynamic elevation,
      Color shadowColor,
      Color selectedShadowColor,
      ShapeBorder avatarBorder,
      }
    ) =>
      ChoiceChip(
      key: key,
      avatar: avatar,
      label: label,
      labelStyle: labelStyle,
      labelPadding: labelPadding,
      onSelected: createValueChangedGenericClosure<bool>(_choiceChip.buildOwner, onSelected),
      pressElevation: pressElevation?.toDouble(),
      selected: selected,
      selectedColor: selectedColor,
      disabledColor: disabledColor,
      tooltip: tooltip,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      backgroundColor: backgroundColor,
      padding: padding,
      visualDensity: visualDensity,
      materialTapTargetSize: materialTapTargetSize,
      elevation: elevation?.toDouble(),
      shadowColor: shadowColor,
      selectedShadowColor: selectedShadowColor,
      avatarBorder: avatarBorder,
    ),
);
var _filterChip = MXFunctionInvoke(
    "FilterChip",
    (
      {
      Key key,
      Widget avatar,
      Widget label,
      TextStyle labelStyle,
      EdgeInsetsGeometry labelPadding,
      bool selected = false,
      dynamic onSelected,
      dynamic pressElevation,
      Color disabledColor,
      Color selectedColor,
      String tooltip,
      ShapeBorder shape,
      Clip clipBehavior = Clip.none,
      FocusNode focusNode,
      bool autofocus = false,
      Color backgroundColor,
      EdgeInsetsGeometry padding,
      VisualDensity visualDensity,
      MaterialTapTargetSize materialTapTargetSize,
      dynamic elevation,
      Color shadowColor,
      Color selectedShadowColor,
      bool showCheckmark,
      Color checkmarkColor,
      ShapeBorder avatarBorder,
      }
    ) =>
      FilterChip(
      key: key,
      avatar: avatar,
      label: label,
      labelStyle: labelStyle,
      labelPadding: labelPadding,
      selected: selected,
      onSelected: createValueChangedGenericClosure<bool>(_filterChip.buildOwner, onSelected),
      pressElevation: pressElevation?.toDouble(),
      disabledColor: disabledColor,
      selectedColor: selectedColor,
      tooltip: tooltip,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      backgroundColor: backgroundColor,
      padding: padding,
      visualDensity: visualDensity,
      materialTapTargetSize: materialTapTargetSize,
      elevation: elevation?.toDouble(),
      shadowColor: shadowColor,
      selectedShadowColor: selectedShadowColor,
      showCheckmark: showCheckmark,
      checkmarkColor: checkmarkColor,
      avatarBorder: avatarBorder,
    ),
);
var _actionChip = MXFunctionInvoke(
    "ActionChip",
    (
      {
      Key key,
      Widget avatar,
      Widget label,
      TextStyle labelStyle,
      EdgeInsetsGeometry labelPadding,
      dynamic onPressed,
      dynamic pressElevation,
      String tooltip,
      ShapeBorder shape,
      Clip clipBehavior = Clip.none,
      FocusNode focusNode,
      bool autofocus = false,
      Color backgroundColor,
      EdgeInsetsGeometry padding,
      VisualDensity visualDensity,
      MaterialTapTargetSize materialTapTargetSize,
      dynamic elevation,
      Color shadowColor,
      }
    ) =>
      ActionChip(
      key: key,
      avatar: avatar,
      label: label,
      labelStyle: labelStyle,
      labelPadding: labelPadding,
      onPressed: createVoidCallbackClosure(_actionChip.buildOwner, onPressed),
      pressElevation: pressElevation?.toDouble(),
      tooltip: tooltip,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      backgroundColor: backgroundColor,
      padding: padding,
      visualDensity: visualDensity,
      materialTapTargetSize: materialTapTargetSize,
      elevation: elevation?.toDouble(),
      shadowColor: shadowColor,
    ),
);
var _rawChip = MXFunctionInvoke(
    "RawChip",
    (
      {
      Key key,
      Widget avatar,
      Widget label,
      TextStyle labelStyle,
      EdgeInsetsGeometry padding,
      VisualDensity visualDensity,
      EdgeInsetsGeometry labelPadding,
      Widget deleteIcon,
      dynamic onDeleted,
      Color deleteIconColor,
      String deleteButtonTooltipMessage,
      dynamic onPressed,
      dynamic onSelected,
      dynamic pressElevation,
      bool tapEnabled = true,
      bool selected = false,
      bool isEnabled = true,
      Color disabledColor,
      Color selectedColor,
      String tooltip,
      ShapeBorder shape,
      Clip clipBehavior = Clip.none,
      FocusNode focusNode,
      bool autofocus = false,
      Color backgroundColor,
      MaterialTapTargetSize materialTapTargetSize,
      dynamic elevation,
      Color shadowColor,
      Color selectedShadowColor,
      bool showCheckmark = true,
      Color checkmarkColor,
      ShapeBorder avatarBorder,
      }
    ) =>
      RawChip(
      key: key,
      avatar: avatar,
      label: label,
      labelStyle: labelStyle,
      padding: padding,
      visualDensity: visualDensity,
      labelPadding: labelPadding,
      deleteIcon: deleteIcon,
      onDeleted: createVoidCallbackClosure(_rawChip.buildOwner, onDeleted),
      deleteIconColor: deleteIconColor,
      deleteButtonTooltipMessage: deleteButtonTooltipMessage,
      onPressed: createVoidCallbackClosure(_rawChip.buildOwner, onPressed),
      onSelected: createValueChangedGenericClosure<bool>(_rawChip.buildOwner, onSelected),
      pressElevation: pressElevation?.toDouble(),
      tapEnabled: tapEnabled,
      selected: selected,
      isEnabled: isEnabled,
      disabledColor: disabledColor,
      selectedColor: selectedColor,
      tooltip: tooltip,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      backgroundColor: backgroundColor,
      materialTapTargetSize: materialTapTargetSize,
      elevation: elevation?.toDouble(),
      shadowColor: shadowColor,
      selectedShadowColor: selectedShadowColor,
      showCheckmark: showCheckmark,
      checkmarkColor: checkmarkColor,
      avatarBorder: avatarBorder,
    ),
);
