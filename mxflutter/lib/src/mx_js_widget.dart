//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:flutter/material.dart';
import 'mx_json_build_owner.dart';
import 'mx_js_flutter_common.dart';

mixin MXJSWidgetBase {
  String get widgetID;
  Map get widgetData;
  String get buildWidgetDataSeq;

  static Widget get errorWidget {
    return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ));
  }

  static Widget get loadingWidget {
    return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ));
  }

  /// Flutter 侧生成的MXWidget widgetID 从1开始，为奇数 +2
  static int _widgetIDFeed = 1;

  static String generateWidgetID() {
    // Flutter 侧生成的MXWidget widgetID 从1开始，为奇数 +2
    _widgetIDFeed = _widgetIDFeed + 2;
    return _widgetIDFeed.toString();
  }
}

/// 封装JSWidget
class MXJSStatefulWidget extends StatefulWidget with MXJSWidgetBase {
  final String name;
  final String widgetID;
  final Map widgetData;

  /// widgetData的seq
  final String buildWidgetDataSeq;

  /// The Widget Pages that pushed this Widget ID
  /// 把当前widget（this） push 出来的widget ID
  final String navPushingWidgetID;

  /// 通过 MXJsonBuildOwner 组成MXJSWidget的树形结构，管理MXJSWidget build过程
  final MXJsonBuildOwner parentBuildOwnerNode;

  final bool isHostWidget;

  MXJSStatefulWidget(
      {Key key,
      this.name,
      this.widgetID,
      this.widgetData,
      this.buildWidgetDataSeq,
      this.navPushingWidgetID,
      this.parentBuildOwnerNode})
      : this.isHostWidget = false,
        super(key: key);

  ///由dart侧创建MXWidget壳子
  MXJSStatefulWidget.hostWidget({Key key, this.name, this.parentBuildOwnerNode})
      : this.widgetID = MXJSWidgetBase.generateWidgetID(),
        this.widgetData = null,
        this.isHostWidget = true,
        this.buildWidgetDataSeq = null,
        this.navPushingWidgetID = null,
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MXJSWidgetState();
  }

  @override
  MXJSStatefulElement createElement() {
    var element = MXJSStatefulElement(this);
    element.buildOwnerNode = MXJsonBuildOwner(element);
    parentBuildOwnerNode.addChild(widgetID, element.buildOwnerNode);
    return element;
  }
}

class MXJSStatefulElement extends StatefulElement {
  MXJSStatefulElement(MXJSStatefulWidget widget) : super(widget);

  MXJsonBuildOwner buildOwnerNode;

  @override
  MXJSStatefulWidget get widget => super.widget as MXJSStatefulWidget;

}

class MXJSWidgetState extends State<MXJSStatefulWidget>
    with SingleTickerProviderStateMixin {
  // 三个场景会更新widgetData
  // 1. 初始化 2. MXJSStatefulWidget的element被复用 3. MXJSWidgetState本身被js 刷新
  Map widgetBuildData;
  String widgetBuildDataSeq;

  MXJSWidgetState();

  @override
  void initState() {
    super.initState();

    _updateStateWidgetData();
  }

  @override
  void didUpdateWidget(MXJSStatefulWidget old) {
    super.didUpdateWidget(old);
    // 当MXJSStatefulWidget 在element树中被复用，需要更新widgetData
    _updateStateWidgetData();

    /// 如果widget Tree相同位置都是 MXJSStatefulElement，但是widgetID 不同
    /// 按flutter的机制会复用 MXJSStatefulElement，调用update相关函数
    /// TODO： 需要重置下buildOwnerNode
    if (widget.widgetID != old.widgetID) {
      MXJSLog.log(
          "MXJSWidgetState:didUpdateWidget:widget.widgetID != old.widgetID "
          "widgetID ${widget.widgetID}"
          "old.widgetID:${old.widgetID} "
          "init BuildOwnerNode");
      buildOwnerNode.reset();
    }
  }

  _updateStateWidgetData() {
    // state初始化时，用widget的widgetData ，之后等js侧的刷新
    widgetBuildData = widget.widgetData;
    widgetBuildDataSeq = widget.buildWidgetDataSeq;
  }

  @override
  void dispose() {
    super.dispose();
    buildOwnerNode.onDispose();
  }

  MXJsonBuildOwner get buildOwnerNode =>
      (context as MXJSStatefulElement).buildOwnerNode;

  @override
  Widget build(BuildContext context) {
    assert(buildOwnerNode != null);

    MXJSLog.log("MXJSStatefulWidget:build begin: widgetID ${widget.widgetID}"
        "curWidgetBuildDataSeq:$widgetBuildDataSeq ");

    if (widgetBuildData == null) {
      // host 等待js刷新，先显示loading页面
      // TODO: 定制loading页面和 error 页面
      if (widget.isHostWidget) {
        return MXJSWidgetBase.loadingWidget;
      } else {
        MXJSLog.error("MXJSWidgetState:build: widget.widgetData == null "
            "this.widget.widgetID:${this.widget.widgetID}");
        return MXJSWidgetBase.errorWidget;
      }
    }

    Widget child = buildOwnerNode.buildWidgetData(widgetBuildData, context);

    if (child == null) {
      MXJSLog.error(
          "MXJSWidgetState:build: _j2dBuild(widgetData, context) == null error; "
          "this.widget.widgetID:${this.widget.widgetID}");
      child = MXJSWidgetBase.errorWidget;
    }

    //call JS层，Flutter UI 使用当前JSWidget哪个序列号的数据构建，callbackID,widgetID  与之对应
    MXJSLog.debug("MXJSStatefulWidget:building: widget:$child callJSOnBuildEnd "
        "widgetID ${widget.widgetID} curWidgetBuildDataSeq:$widgetBuildDataSeq");

    buildOwnerNode.callJSOnBuildEnd();

    MXJSLog.log("MXJSStatefulWidget:build end: widget:$child "
        "callJSOnBuildEnd  widgetID ${widget.widgetID} "
        "widgetBuildDataSeq:$widgetBuildDataSeq} ");
    return child;
  }

  jsCallRebuild(
      String widgetID, Map widgetBuildData, String buildWidgetDataSeq) {
    if (this.widget.widgetID != widgetID) {
      MXJSLog.error("MXJSWidgetState:jsCallRebuild: error "
          "this.widget.widgetID:(${this.widget.widgetID}) != widgetID:($widgetID)");
      return;
    }

    setState(() {
      this.widgetBuildData = widgetBuildData;
      this.widgetBuildDataSeq = buildWidgetDataSeq;
    });

    MXJSLog.log("MXJSWidgetState:jsCallRebuild:  "
        " widgetID:($widgetID) widgetBuildDataSeq:$widgetBuildDataSeq");

    MXJSLog.debug("MXJSWidgetState:jsCallRebuild:  "
        " widgetID:($widgetID) widgetBuildDataSeq:$widgetBuildDataSeq widgetBuildData:$widgetBuildData ");
  }
}

/// 静态json生成Widget
class MXJSStatelessWidget extends StatelessWidget with MXJSWidgetBase {
  final String name;
  final String widgetID;
  final Map widgetData;

  /// widgetData的seq
  final String buildWidgetDataSeq;

  /// The Widget Pages that pushed this Widget ID
  /// 把当前widget（this） push 出来的widget ID
  final String navPushingWidgetID;

  /// 通过 MXJsonBuildOwner 组成MXJSWidget的树形结构，管理MXJSWidget build过程
  final MXJsonBuildOwner parentBuildOwnerNode;

  MXJSStatelessWidget(
      {Key key,
      this.name,
      this.widgetID,
      this.widgetData,
      this.buildWidgetDataSeq,
      this.navPushingWidgetID,
      this.parentBuildOwnerNode})
      : super(key: key);

  @override
  MXJSStatelessElement createElement() {
    var element = MXJSStatelessElement(this);
    element.buildOwnerNode = MXJsonBuildOwner(element);
    parentBuildOwnerNode.addChild(widgetID, element.buildOwnerNode);
    return element;
  }

  @override
  Widget build(BuildContext context) {
    assert(parentBuildOwnerNode != null);

    MXJSLog.log("MXJSStatelessWidget:build begin: widgetID $widgetID"
        "curBuildWidgetDataSeq:$buildWidgetDataSeq ");

    if (widgetData == null) {
      // TODO: 定制loading页面和 error 页面
      MXJSLog.error("MXJSWidgetState:build: widgetData == null "
          "this.widget.widgetID:${this.widgetID}");
      return MXJSWidgetBase.errorWidget;
    }

    MXJSStatelessElement element = context as MXJSStatelessElement;
    MXJsonBuildOwner boNode = element.buildOwnerNode;
    Widget child = boNode.buildWidgetData(widgetData, context);

    if (child == null) {
      MXJSLog.error(
          "MXJSWidgetState:build: _j2dBuild(widgetData, context) == null error; "
          "this.widget.widgetID:$widgetID");
      child = MXJSWidgetBase.errorWidget;
    }

    //call JS层，Flutter UI 使用当前JSWidget哪个序列号的数据构建，callbackID,widgetID  与之对应
    MXJSLog.debug(
        "MXJSStatelessWidget:building: widget:$child callJSOnBuildEnd "
        "widgetID $widgetID curBuildWidgetDataSeq:$buildWidgetDataSeq");

    parentBuildOwnerNode.callJSOnBuildEnd();

    MXJSLog.log("MXJSStatefulWidget:build end: widget:$child "
        "callJSOnBuildEnd  widgetID $widgetID "
        "buildWidgetDataSeq:$buildWidgetDataSeq} ");
    return child;
  }
}

class MXJSStatelessElement extends StatelessElement {
  MXJsonBuildOwner buildOwnerNode;

  MXJSStatelessElement(MXJSStatelessWidget widget) : super(widget);

  @override
  MXJSStatelessWidget get widget => super.widget as MXJSStatelessWidget;

  @override
  void unmount() {
    buildOwnerNode.onUnmount();
    super.unmount();
  }
}
