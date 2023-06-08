/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

import 'package:KDDockWidgets/PositionedWidget.dart';
import 'package:KDDockWidgets/View_mixin.dart';
import 'package:KDDockWidgets/WindowWidget.dart';
import 'package:KDDockWidgetsBindings/Bindings.dart' as KDDockWidgetBindings;
import 'package:KDDockWidgetsBindings/Bindings_KDDWBindingsCore.dart'
    as KDDWBindingsCore;
import 'package:KDDockWidgetsBindings/Bindings_KDDWBindingsFlutter.dart'
    as KDDWBindingsFlutter;
import 'package:flutter/material.dart' hide View;
import 'TitleBar.dart';
import 'DropArea.dart';

class FloatingWindow extends KDDWBindingsFlutter.View with View_mixin {
  late final KDDWBindingsCore.FloatingWindow m_controller;

  FloatingWindow(
      KDDWBindingsCore.Controller? controller, KDDWBindingsCore.View? parent,
      {int windowFlags = 0})
      : super(controller, KDDockWidgetBindings.Core_ViewType.FloatingWindow,
            parent,
            windowFlags: windowFlags) {
    m_controller = controller! as KDDWBindingsCore.FloatingWindow;
    m_fillsParent = true;

    initMixin(this, debugName: "FloatingWindow", parent: parent);
    windowWidget = WindowWidget.fromView(this);
  }

  TitleBar titleBarView() {
    return KDDWBindingsFlutter.View.fromCache(
        m_controller.titleBar().view().thisCpp) as TitleBar;
  }

  DropArea dropAreaView() {
    return KDDWBindingsFlutter.View.fromCache(
        m_controller.dropArea().view().thisCpp) as DropArea;
  }

  PositionedWidget createFlutterWidget() {
    return FloatingWindowWidget(this, key: widgetKey);
  }
}

class FloatingWindowWidget extends PositionedWidget {
  final FloatingWindow view;
  FloatingWindowWidget(this.view, {Key? key}) : super(view, key: key);

  @override
  State<PositionedWidget> createState() {
    return FloatingWindowPositionedWidgetState(view);
  }
}

class FloatingWindowPositionedWidgetState extends PositionedWidgetState {
  final FloatingWindow view;

  FloatingWindowPositionedWidgetState(this.view) : super(view);

  @override
  Widget buildContents(BuildContext ctx) {
    final titleBarWidget = view.titleBarView().flutterWidget;
    final dropAreaWidget = view.dropAreaView().flutterWidget;

    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 4,
          ),
        ),
        child: Column(
            children: [titleBarWidget, Expanded(child: dropAreaWidget)]));
  }
}
