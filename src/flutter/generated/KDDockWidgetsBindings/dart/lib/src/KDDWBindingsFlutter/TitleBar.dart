/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import '../TypeHelpers.dart';
import '../../Bindings.dart';
import '../../Bindings_KDDWBindingsCore.dart' as KDDWBindingsCore;
import '../../Bindings_KDDWBindingsFlutter.dart' as KDDWBindingsFlutter;
import '../../LibraryLoader.dart';
import '../../FinalizerHelpers.dart';

var _dylib = Library.instance().dylib;

class TitleBar extends KDDWBindingsFlutter.View {
  TitleBar.fromCppPointer(var cppPointer, [var needsAutoDelete = false])
      : super.fromCppPointer(cppPointer, needsAutoDelete) {}
  TitleBar.init() : super.init() {}
  factory TitleBar.fromCache(var cppPointer, [needsAutoDelete = false]) {
    if (KDDWBindingsCore.View.isCached(cppPointer)) {
      var instance =
          KDDWBindingsCore.View.s_dartInstanceByCppPtr[cppPointer.address];
      if (instance != null) return instance as TitleBar;
    }
    return TitleBar.fromCppPointer(cppPointer, needsAutoDelete);
  } //TitleBar(KDDockWidgets::Core::TitleBar * controller, KDDockWidgets::Core::View * parent)
  TitleBar(KDDWBindingsCore.TitleBar? controller,
      {required KDDWBindingsCore.View? parent})
      : super.init() {
    final voidstar_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__TitleBar__constructor_TitleBar_View')
        .asFunction();
    thisCpp = func(controller == null ? ffi.nullptr : controller.thisCpp,
        parent == null ? ffi.nullptr : parent.thisCpp);
    KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] = this;
    registerCallbacks();
  }
  static void activateWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::activateWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.activateWindow();
  }

  static int close_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::close()! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.close();
    return result ? 1 : 0;
  }

  static void createPlatformWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::createPlatformWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.createPlatformWindow();
  }

  static int flags_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::flags() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.flags();
    return result;
  }

  static void free_impl_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::free_impl()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.free_impl();
  }

  static ffi.Pointer<void> geometry_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::geometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.geometry();
    return result.thisCpp;
  }

  static void grabMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::grabMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.grabMouse();
  }

  static int hasFocus_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::hasFocus() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.hasFocus();
    return result ? 1 : 0;
  }

  static void hide_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::hide()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.hide();
  }

  static void init_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::init()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.init();
  }

  static int isActiveWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isActiveWindow() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isActiveWindow();
    return result ? 1 : 0;
  } // isCloseButtonEnabled() const

  bool isCloseButtonEnabled() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(1053))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isCloseButtonEnabled_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isCloseButtonEnabled() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isCloseButtonEnabled();
    return result ? 1 : 0;
  } // isCloseButtonVisible() const

  bool isCloseButtonVisible() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(1054))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isCloseButtonVisible_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isCloseButtonVisible() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isCloseButtonVisible();
    return result ? 1 : 0;
  }

  static int isExpicitlyHidden_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isExpicitlyHidden() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isExpicitlyHidden();
    return result ? 1 : 0;
  } // isFloatButtonVisible() const

  bool isFloatButtonVisible() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(1055))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isFloatButtonVisible_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isFloatButtonVisible() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isFloatButtonVisible();
    return result ? 1 : 0;
  }

  static int isMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isMaximized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMaximized();
    return result ? 1 : 0;
  }

  static int isMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isMinimized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMinimized();
    return result ? 1 : 0;
  }

  static int isNull_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isNull() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isNull();
    return result ? 1 : 0;
  }

  static int isRootView_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isRootView() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isRootView();
    return result ? 1 : 0;
  }

  static int isVisible_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::isVisible() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isVisible();
    return result ? 1 : 0;
  }

  static ffi.Pointer<void> mapFromGlobal_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> globalPt) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::mapFromGlobal(QPoint globalPt) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapFromGlobal(QPoint.fromCppPointer(globalPt));
    return result.thisCpp;
  }

  static ffi.Pointer<void> mapTo_calledFromC(ffi.Pointer<void> thisCpp,
      ffi.Pointer<void>? parent, ffi.Pointer<void> pos) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::mapTo(KDDockWidgets::Core::View * parent, QPoint pos) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapTo(
        (parent == null || parent.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(parent),
        QPoint.fromCppPointer(pos));
    return result.thisCpp;
  }

  static ffi.Pointer<void> mapToGlobal_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> localPt) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::mapToGlobal(QPoint localPt) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapToGlobal(QPoint.fromCppPointer(localPt));
    return result.thisCpp;
  }

  static ffi.Pointer<void> maxSizeHint_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::maxSizeHint() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.maxSizeHint();
    return result.thisCpp;
  }

  static ffi.Pointer<void> minSize_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::minSize() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.minSize();
    return result.thisCpp;
  }

  static int minimumHeight_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::minimumHeight() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.minimumHeight();
    return result;
  }

  static int minimumWidth_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::minimumWidth() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.minimumWidth();
    return result;
  }

  static void move_2_calledFromC(ffi.Pointer<void> thisCpp, int x, int y) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::move(int x, int y)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.move_2(x, y);
  }

  static ffi.Pointer<void> normalGeometry_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::normalGeometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.normalGeometry();
    return result.thisCpp;
  }

  static ffi.Pointer<void> objectName_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::objectName() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.objectName();
    return result.thisCpp;
  }

  static void onChildAdded_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::onChildAdded(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildAdded((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void onChildRemoved_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::onChildRemoved(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildRemoved((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void onChildVisibilityChanged_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::onChildVisibilityChanged(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildVisibilityChanged(
        (childView == null || childView.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static int onResize_2_calledFromC(ffi.Pointer<void> thisCpp, int w, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::onResize(int w, int h)! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.onResize_2(w, h);
    return result ? 1 : 0;
  }

  static void raise_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::raise()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raise();
  }

  static void raiseAndActivate_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::raiseAndActivate()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseAndActivate();
  }

  static void releaseKeyboard_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::releaseKeyboard()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseKeyboard();
  }

  static void releaseMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::releaseMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseMouse();
  }

  static void setCursor_calledFromC(ffi.Pointer<void> thisCpp, int shape) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setCursor(Qt::CursorShape shape)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setCursor(shape);
  }

  static void setFixedHeight_calledFromC(ffi.Pointer<void> thisCpp, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setFixedHeight(int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedHeight(h);
  }

  static void setFixedWidth_calledFromC(ffi.Pointer<void> thisCpp, int w) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setFixedWidth(int w)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedWidth(w);
  }

  static void setGeometry_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> geometry) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setGeometry(QRect geometry)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setGeometry(QRect.fromCppPointer(geometry));
  }

  static void setHeight_calledFromC(ffi.Pointer<void> thisCpp, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setHeight(int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setHeight(h);
  }

  static void setMaximumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> sz) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setMaximumSize(QSize sz)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMaximumSize(QSize.fromCppPointer(sz));
  }

  static void setMinimumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> sz) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setMinimumSize(QSize sz)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMinimumSize(QSize.fromCppPointer(sz));
  }

  static void setMouseTracking_calledFromC(
      ffi.Pointer<void> thisCpp, int enable) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setMouseTracking(bool enable)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMouseTracking(enable != 0);
  }

  static void setObjectName_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? name) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setObjectName(const QString & name)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setObjectName(QString.fromCppPointer(name).toDartString());
  }

  static void setParent_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? parent) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setParent(KDDockWidgets::Core::View * parent)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setParent((parent == null || parent.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(parent));
  }

  static void setSize_2_calledFromC(ffi.Pointer<void> thisCpp, int w, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setSize(int w, int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setSize_2(w, h);
  }

  static void setVisible_calledFromC(ffi.Pointer<void> thisCpp, int visible) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setVisible(bool visible)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setVisible(visible != 0);
  }

  static void setWidth_calledFromC(ffi.Pointer<void> thisCpp, int w) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setWidth(int w)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWidth(w);
  }

  static void setWindowOpacity_calledFromC(
      ffi.Pointer<void> thisCpp, double v) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setWindowOpacity(double v)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowOpacity(v);
  }

  static void setWindowTitle_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? title) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setWindowTitle(const QString & title)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowTitle(QString.fromCppPointer(title).toDartString());
  }

  static void setZOrder_calledFromC(ffi.Pointer<void> thisCpp, int z) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::setZOrder(int z)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setZOrder(z);
  }

  static void show_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::show()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.show();
  }

  static void showMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::showMaximized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMaximized();
  }

  static void showMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::showMinimized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMinimized();
  }

  static void showNormal_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::showNormal()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showNormal();
  }

  static ffi.Pointer<void> sizeHint_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::sizeHint() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.sizeHint();
    return result.thisCpp;
  }

  static void update_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as TitleBar;
    if (dartInstance == null) {
      print(
          "Dart instance not found for TitleBar::update()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.update();
  }

  void release() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__TitleBar__destructor')
        .asFunction();
    func(thisCpp);
  }

  String cFunctionSymbolName(int methodId) {
    switch (methodId) {
      case 913:
        return "c_KDDockWidgets__flutter__TitleBar__activateWindow";
      case 924:
        return "c_KDDockWidgets__flutter__TitleBar__close";
      case 927:
        return "c_KDDockWidgets__flutter__TitleBar__createPlatformWindow";
      case 933:
        return "c_KDDockWidgets__flutter__TitleBar__flags";
      case 935:
        return "c_KDDockWidgets__flutter__TitleBar__free_impl";
      case 937:
        return "c_KDDockWidgets__flutter__TitleBar__geometry";
      case 939:
        return "c_KDDockWidgets__flutter__TitleBar__grabMouse";
      case 942:
        return "c_KDDockWidgets__flutter__TitleBar__hasFocus";
      case 944:
        return "c_KDDockWidgets__flutter__TitleBar__hide";
      case 947:
        return "c_KDDockWidgets__flutter__TitleBar__init";
      case 949:
        return "c_KDDockWidgets__flutter__TitleBar__isActiveWindow";
      case 1053:
        return "c_KDDockWidgets__flutter__TitleBar__isCloseButtonEnabled";
      case 1054:
        return "c_KDDockWidgets__flutter__TitleBar__isCloseButtonVisible";
      case 950:
        return "c_KDDockWidgets__flutter__TitleBar__isExpicitlyHidden";
      case 1055:
        return "c_KDDockWidgets__flutter__TitleBar__isFloatButtonVisible";
      case 951:
        return "c_KDDockWidgets__flutter__TitleBar__isMaximized";
      case 952:
        return "c_KDDockWidgets__flutter__TitleBar__isMinimized";
      case 953:
        return "c_KDDockWidgets__flutter__TitleBar__isNull";
      case 954:
        return "c_KDDockWidgets__flutter__TitleBar__isRootView";
      case 955:
        return "c_KDDockWidgets__flutter__TitleBar__isVisible";
      case 956:
        return "c_KDDockWidgets__flutter__TitleBar__mapFromGlobal_QPoint";
      case 957:
        return "c_KDDockWidgets__flutter__TitleBar__mapTo_View_QPoint";
      case 958:
        return "c_KDDockWidgets__flutter__TitleBar__mapToGlobal_QPoint";
      case 959:
        return "c_KDDockWidgets__flutter__TitleBar__maxSizeHint";
      case 960:
        return "c_KDDockWidgets__flutter__TitleBar__minSize";
      case 961:
        return "c_KDDockWidgets__flutter__TitleBar__minimumHeight";
      case 962:
        return "c_KDDockWidgets__flutter__TitleBar__minimumWidth";
      case 964:
        return "c_KDDockWidgets__flutter__TitleBar__move_int_int";
      case 965:
        return "c_KDDockWidgets__flutter__TitleBar__normalGeometry";
      case 966:
        return "c_KDDockWidgets__flutter__TitleBar__objectName";
      case 1034:
        return "c_KDDockWidgets__flutter__TitleBar__onChildAdded_View";
      case 1035:
        return "c_KDDockWidgets__flutter__TitleBar__onChildRemoved_View";
      case 1036:
        return "c_KDDockWidgets__flutter__TitleBar__onChildVisibilityChanged_View";
      case 968:
        return "c_KDDockWidgets__flutter__TitleBar__onResize_int_int";
      case 971:
        return "c_KDDockWidgets__flutter__TitleBar__raise";
      case 972:
        return "c_KDDockWidgets__flutter__TitleBar__raiseAndActivate";
      case 974:
        return "c_KDDockWidgets__flutter__TitleBar__releaseKeyboard";
      case 975:
        return "c_KDDockWidgets__flutter__TitleBar__releaseMouse";
      case 979:
        return "c_KDDockWidgets__flutter__TitleBar__setCursor_CursorShape";
      case 980:
        return "c_KDDockWidgets__flutter__TitleBar__setFixedHeight_int";
      case 981:
        return "c_KDDockWidgets__flutter__TitleBar__setFixedWidth_int";
      case 982:
        return "c_KDDockWidgets__flutter__TitleBar__setGeometry_QRect";
      case 983:
        return "c_KDDockWidgets__flutter__TitleBar__setHeight_int";
      case 984:
        return "c_KDDockWidgets__flutter__TitleBar__setMaximumSize_QSize";
      case 985:
        return "c_KDDockWidgets__flutter__TitleBar__setMinimumSize_QSize";
      case 986:
        return "c_KDDockWidgets__flutter__TitleBar__setMouseTracking_bool";
      case 987:
        return "c_KDDockWidgets__flutter__TitleBar__setObjectName_QString";
      case 988:
        return "c_KDDockWidgets__flutter__TitleBar__setParent_View";
      case 990:
        return "c_KDDockWidgets__flutter__TitleBar__setSize_int_int";
      case 991:
        return "c_KDDockWidgets__flutter__TitleBar__setVisible_bool";
      case 992:
        return "c_KDDockWidgets__flutter__TitleBar__setWidth_int";
      case 993:
        return "c_KDDockWidgets__flutter__TitleBar__setWindowOpacity_double";
      case 994:
        return "c_KDDockWidgets__flutter__TitleBar__setWindowTitle_QString";
      case 995:
        return "c_KDDockWidgets__flutter__TitleBar__setZOrder_int";
      case 996:
        return "c_KDDockWidgets__flutter__TitleBar__show";
      case 997:
        return "c_KDDockWidgets__flutter__TitleBar__showMaximized";
      case 998:
        return "c_KDDockWidgets__flutter__TitleBar__showMinimized";
      case 999:
        return "c_KDDockWidgets__flutter__TitleBar__showNormal";
      case 1001:
        return "c_KDDockWidgets__flutter__TitleBar__sizeHint";
      case 1003:
        return "c_KDDockWidgets__flutter__TitleBar__update";
    }
    return super.cFunctionSymbolName(methodId);
  }

  static String methodNameFromId(int methodId) {
    switch (methodId) {
      case 913:
        return "activateWindow";
      case 924:
        return "close";
      case 927:
        return "createPlatformWindow";
      case 933:
        return "flags";
      case 935:
        return "free_impl";
      case 937:
        return "geometry";
      case 939:
        return "grabMouse";
      case 942:
        return "hasFocus";
      case 944:
        return "hide";
      case 947:
        return "init";
      case 949:
        return "isActiveWindow";
      case 1053:
        return "isCloseButtonEnabled";
      case 1054:
        return "isCloseButtonVisible";
      case 950:
        return "isExpicitlyHidden";
      case 1055:
        return "isFloatButtonVisible";
      case 951:
        return "isMaximized";
      case 952:
        return "isMinimized";
      case 953:
        return "isNull";
      case 954:
        return "isRootView";
      case 955:
        return "isVisible";
      case 956:
        return "mapFromGlobal";
      case 957:
        return "mapTo";
      case 958:
        return "mapToGlobal";
      case 959:
        return "maxSizeHint";
      case 960:
        return "minSize";
      case 961:
        return "minimumHeight";
      case 962:
        return "minimumWidth";
      case 964:
        return "move_2";
      case 965:
        return "normalGeometry";
      case 966:
        return "objectName";
      case 1034:
        return "onChildAdded";
      case 1035:
        return "onChildRemoved";
      case 1036:
        return "onChildVisibilityChanged";
      case 968:
        return "onResize_2";
      case 971:
        return "raise";
      case 972:
        return "raiseAndActivate";
      case 974:
        return "releaseKeyboard";
      case 975:
        return "releaseMouse";
      case 979:
        return "setCursor";
      case 980:
        return "setFixedHeight";
      case 981:
        return "setFixedWidth";
      case 982:
        return "setGeometry";
      case 983:
        return "setHeight";
      case 984:
        return "setMaximumSize";
      case 985:
        return "setMinimumSize";
      case 986:
        return "setMouseTracking";
      case 987:
        return "setObjectName";
      case 988:
        return "setParent";
      case 990:
        return "setSize_2";
      case 991:
        return "setVisible";
      case 992:
        return "setWidth";
      case 993:
        return "setWindowOpacity";
      case 994:
        return "setWindowTitle";
      case 995:
        return "setZOrder";
      case 996:
        return "show";
      case 997:
        return "showMaximized";
      case 998:
        return "showMinimized";
      case 999:
        return "showNormal";
      case 1001:
        return "sizeHint";
      case 1003:
        return "update";
    }
    throw Error();
  }

  void registerCallbacks() {
    assert(thisCpp != null);
    final RegisterMethodIsReimplementedCallback registerCallback = _dylib
        .lookup<ffi.NativeFunction<RegisterMethodIsReimplementedCallback_FFI>>(
            'c_KDDockWidgets__flutter__TitleBar__registerVirtualMethodCallback')
        .asFunction();
    final callback913 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.activateWindow_calledFromC);
    registerCallback(thisCpp, callback913, 913);
    const callbackExcept924 = 0;
    final callback924 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.close_calledFromC, callbackExcept924);
    registerCallback(thisCpp, callback924, 924);
    final callback927 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsCore.View.createPlatformWindow_calledFromC);
    registerCallback(thisCpp, callback927, 927);
    const callbackExcept933 = 0;
    final callback933 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.flags_calledFromC, callbackExcept933);
    registerCallback(thisCpp, callback933, 933);
    final callback935 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.free_impl_calledFromC);
    registerCallback(thisCpp, callback935, 935);
    final callback937 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.geometry_calledFromC);
    registerCallback(thisCpp, callback937, 937);
    final callback939 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.grabMouse_calledFromC);
    registerCallback(thisCpp, callback939, 939);
    const callbackExcept942 = 0;
    final callback942 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.hasFocus_calledFromC, callbackExcept942);
    registerCallback(thisCpp, callback942, 942);
    final callback944 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.hide_calledFromC);
    registerCallback(thisCpp, callback944, 944);
    final callback947 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.TitleBar.init_calledFromC);
    registerCallback(thisCpp, callback947, 947);
    const callbackExcept949 = 0;
    final callback949 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isActiveWindow_calledFromC, callbackExcept949);
    registerCallback(thisCpp, callback949, 949);
    const callbackExcept1053 = 0;
    final callback1053 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.TitleBar.isCloseButtonEnabled_calledFromC,
        callbackExcept1053);
    registerCallback(thisCpp, callback1053, 1053);
    const callbackExcept1054 = 0;
    final callback1054 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.TitleBar.isCloseButtonVisible_calledFromC,
        callbackExcept1054);
    registerCallback(thisCpp, callback1054, 1054);
    const callbackExcept950 = 0;
    final callback950 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isExpicitlyHidden_calledFromC,
        callbackExcept950);
    registerCallback(thisCpp, callback950, 950);
    const callbackExcept1055 = 0;
    final callback1055 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.TitleBar.isFloatButtonVisible_calledFromC,
        callbackExcept1055);
    registerCallback(thisCpp, callback1055, 1055);
    const callbackExcept951 = 0;
    final callback951 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMaximized_calledFromC, callbackExcept951);
    registerCallback(thisCpp, callback951, 951);
    const callbackExcept952 = 0;
    final callback952 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMinimized_calledFromC, callbackExcept952);
    registerCallback(thisCpp, callback952, 952);
    const callbackExcept953 = 0;
    final callback953 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsCore.View.isNull_calledFromC, callbackExcept953);
    registerCallback(thisCpp, callback953, 953);
    const callbackExcept954 = 0;
    final callback954 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isRootView_calledFromC, callbackExcept954);
    registerCallback(thisCpp, callback954, 954);
    const callbackExcept955 = 0;
    final callback955 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isVisible_calledFromC, callbackExcept955);
    registerCallback(thisCpp, callback955, 955);
    final callback956 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapFromGlobal_calledFromC);
    registerCallback(thisCpp, callback956, 956);
    final callback957 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapTo_calledFromC);
    registerCallback(thisCpp, callback957, 957);
    final callback958 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapToGlobal_calledFromC);
    registerCallback(thisCpp, callback958, 958);
    final callback959 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.maxSizeHint_calledFromC);
    registerCallback(thisCpp, callback959, 959);
    final callback960 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.minSize_calledFromC);
    registerCallback(thisCpp, callback960, 960);
    const callbackExcept961 = 0;
    final callback961 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        KDDWBindingsCore.View.minimumHeight_calledFromC, callbackExcept961);
    registerCallback(thisCpp, callback961, 961);
    const callbackExcept962 = 0;
    final callback962 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        KDDWBindingsCore.View.minimumWidth_calledFromC, callbackExcept962);
    registerCallback(thisCpp, callback962, 962);
    final callback964 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.move_2_calledFromC);
    registerCallback(thisCpp, callback964, 964);
    final callback965 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.normalGeometry_calledFromC);
    registerCallback(thisCpp, callback965, 965);
    final callback966 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.objectName_calledFromC);
    registerCallback(thisCpp, callback966, 966);
    final callback1034 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildAdded_calledFromC);
    registerCallback(thisCpp, callback1034, 1034);
    final callback1035 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildRemoved_calledFromC);
    registerCallback(thisCpp, callback1035, 1035);
    final callback1036 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildVisibilityChanged_calledFromC);
    registerCallback(thisCpp, callback1036, 1036);
    const callbackExcept968 = 0;
    final callback968 =
        ffi.Pointer.fromFunction<bool_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.onResize_2_calledFromC, callbackExcept968);
    registerCallback(thisCpp, callback968, 968);
    final callback971 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.raise_calledFromC);
    registerCallback(thisCpp, callback971, 971);
    final callback972 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.raiseAndActivate_calledFromC);
    registerCallback(thisCpp, callback972, 972);
    final callback974 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.releaseKeyboard_calledFromC);
    registerCallback(thisCpp, callback974, 974);
    final callback975 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.releaseMouse_calledFromC);
    registerCallback(thisCpp, callback975, 975);
    final callback979 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setCursor_calledFromC);
    registerCallback(thisCpp, callback979, 979);
    final callback980 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setFixedHeight_calledFromC);
    registerCallback(thisCpp, callback980, 980);
    final callback981 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setFixedWidth_calledFromC);
    registerCallback(thisCpp, callback981, 981);
    final callback982 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setGeometry_calledFromC);
    registerCallback(thisCpp, callback982, 982);
    final callback983 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setHeight_calledFromC);
    registerCallback(thisCpp, callback983, 983);
    final callback984 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setMaximumSize_calledFromC);
    registerCallback(thisCpp, callback984, 984);
    final callback985 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setMinimumSize_calledFromC);
    registerCallback(thisCpp, callback985, 985);
    final callback986 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            KDDWBindingsFlutter.View.setMouseTracking_calledFromC);
    registerCallback(thisCpp, callback986, 986);
    final callback987 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setObjectName_calledFromC);
    registerCallback(thisCpp, callback987, 987);
    final callback988 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setParent_calledFromC);
    registerCallback(thisCpp, callback988, 988);
    final callback990 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setSize_2_calledFromC);
    registerCallback(thisCpp, callback990, 990);
    final callback991 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            KDDWBindingsFlutter.View.setVisible_calledFromC);
    registerCallback(thisCpp, callback991, 991);
    final callback992 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setWidth_calledFromC);
    registerCallback(thisCpp, callback992, 992);
    final callback993 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Double_FFI>(
            KDDWBindingsFlutter.View.setWindowOpacity_calledFromC);
    registerCallback(thisCpp, callback993, 993);
    final callback994 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setWindowTitle_calledFromC);
    registerCallback(thisCpp, callback994, 994);
    final callback995 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setZOrder_calledFromC);
    registerCallback(thisCpp, callback995, 995);
    final callback996 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.show_calledFromC);
    registerCallback(thisCpp, callback996, 996);
    final callback997 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showMaximized_calledFromC);
    registerCallback(thisCpp, callback997, 997);
    final callback998 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showMinimized_calledFromC);
    registerCallback(thisCpp, callback998, 998);
    final callback999 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showNormal_calledFromC);
    registerCallback(thisCpp, callback999, 999);
    final callback1001 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.sizeHint_calledFromC);
    registerCallback(thisCpp, callback1001, 1001);
    final callback1003 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.update_calledFromC);
    registerCallback(thisCpp, callback1003, 1003);
  }
}