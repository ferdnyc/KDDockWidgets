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

var _dylib = Library.instance().dylib;

class ClassicDropIndicatorOverlay extends DropIndicatorOverlay {
  ClassicDropIndicatorOverlay.fromCppPointer(var cppPointer,
      [var needsAutoDelete = false])
      : super.fromCppPointer(cppPointer, needsAutoDelete) {}
  ClassicDropIndicatorOverlay.init() : super.init() {}
  factory ClassicDropIndicatorOverlay.fromCache(var cppPointer,
      [needsAutoDelete = false]) {
    if (KDDWBindingsCore.Object.isCached(cppPointer)) {
      var instance =
          KDDWBindingsCore.Object.s_dartInstanceByCppPtr[cppPointer.address];
      if (instance != null) return instance as ClassicDropIndicatorOverlay;
    }
    return ClassicDropIndicatorOverlay.fromCppPointer(
        cppPointer, needsAutoDelete);
  } //ClassicDropIndicatorOverlay(KDDockWidgets::Core::DropArea * dropArea)
  ClassicDropIndicatorOverlay(KDDWBindingsCore.DropArea? dropArea)
      : super.init() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__constructor_DropArea')
        .asFunction();
    thisCpp = func(dropArea == null ? ffi.nullptr : dropArea.thisCpp);
    KDDWBindingsCore.Object.s_dartInstanceByCppPtr[thisCpp.address] = this;
    registerCallbacks();
  }
  static int dropIndicatorVisible_calledFromC(
      ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = KDDWBindingsCore.Object
        .s_dartInstanceByCppPtr[thisCpp.address] as ClassicDropIndicatorOverlay;
    if (dartInstance == null) {
      print(
          "Dart instance not found for ClassicDropIndicatorOverlay::dropIndicatorVisible(KDDockWidgets::DropLocation arg__1) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.dropIndicatorVisible(arg__1);
    return result ? 1 : 0;
  } // geometryForRubberband(KDDockWidgets::Rect localRect) const

  Rect geometryForRubberband(Rect localRect) {
    final voidstar_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_voidstar_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__geometryForRubberband_Rect')
        .asFunction();
    ffi.Pointer<void> result =
        func(thisCpp, localRect == null ? ffi.nullptr : localRect.thisCpp);
    return Rect.fromCppPointer(result, true);
  }

  static int hover_impl_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> globalPos) {
    var dartInstance = KDDWBindingsCore.Object
        .s_dartInstanceByCppPtr[thisCpp.address] as ClassicDropIndicatorOverlay;
    if (dartInstance == null) {
      print(
          "Dart instance not found for ClassicDropIndicatorOverlay::hover_impl(KDDockWidgets::Point globalPos)! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.hover_impl(Point.fromCppPointer(globalPos));
    return result;
  } // indicatorWindow() const

  KDDWBindingsCore.ClassicIndicatorWindowViewInterface indicatorWindow() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__indicatorWindow')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return KDDWBindingsCore.ClassicIndicatorWindowViewInterface.fromCppPointer(
        result, false);
  }

  static void onHoveredGroupChanged_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? arg__1) {
    var dartInstance = KDDWBindingsCore.Object
        .s_dartInstanceByCppPtr[thisCpp.address] as ClassicDropIndicatorOverlay;
    if (dartInstance == null) {
      print(
          "Dart instance not found for ClassicDropIndicatorOverlay::onHoveredGroupChanged(KDDockWidgets::Core::Group * arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onHoveredGroupChanged((arg__1 == null || arg__1.address == 0)
        ? null
        : KDDWBindingsCore.Group.fromCppPointer(arg__1));
  } // onResize(KDDockWidgets::Size newSize)

  bool onResize(Size newSize) {
    final bool_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_voidstar_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__onResize_Size')
        .asFunction();
    return func(thisCpp, newSize == null ? ffi.nullptr : newSize.thisCpp) != 0;
  }

  static ffi.Pointer<void> posForIndicator_calledFromC(
      ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = KDDWBindingsCore.Object
        .s_dartInstanceByCppPtr[thisCpp.address] as ClassicDropIndicatorOverlay;
    if (dartInstance == null) {
      print(
          "Dart instance not found for ClassicDropIndicatorOverlay::posForIndicator(KDDockWidgets::DropLocation arg__1) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.posForIndicator(arg__1);
    return result.thisCpp;
  } // raiseIndicators()

  raiseIndicators() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__raiseIndicators')
        .asFunction();
    func(thisCpp);
  } // rubberBand() const

  KDDWBindingsCore.View rubberBand() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__rubberBand')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return KDDWBindingsCore.View.fromCppPointer(result, false);
  } // rubberBandIsTopLevel() const

  bool rubberBandIsTopLevel() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__rubberBandIsTopLevel')
        .asFunction();
    return func(thisCpp) != 0;
  }

  static void setCurrentDropLocation_calledFromC(
      ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = KDDWBindingsCore.Object
        .s_dartInstanceByCppPtr[thisCpp.address] as ClassicDropIndicatorOverlay;
    if (dartInstance == null) {
      print(
          "Dart instance not found for ClassicDropIndicatorOverlay::setCurrentDropLocation(KDDockWidgets::DropLocation arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setCurrentDropLocation(arg__1);
  }

  static void setParentView_impl_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? parent) {
    var dartInstance = KDDWBindingsCore.Object
        .s_dartInstanceByCppPtr[thisCpp.address] as ClassicDropIndicatorOverlay;
    if (dartInstance == null) {
      print(
          "Dart instance not found for ClassicDropIndicatorOverlay::setParentView_impl(KDDockWidgets::Core::View * parent)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setParentView_impl((parent == null || parent.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(parent));
  }

  static void updateVisibility_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore.Object
        .s_dartInstanceByCppPtr[thisCpp.address] as ClassicDropIndicatorOverlay;
    if (dartInstance == null) {
      print(
          "Dart instance not found for ClassicDropIndicatorOverlay::updateVisibility()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.updateVisibility();
  } // updateWindowPosition()

  updateWindowPosition() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__updateWindowPosition')
        .asFunction();
    func(thisCpp);
  }

  void release() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__destructor')
        .asFunction();
    func(thisCpp);
  }

  String cFunctionSymbolName(int methodId) {
    switch (methodId) {
      case 1348:
        return "c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__dropIndicatorVisible_DropLocation";
      case 1352:
        return "c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__hover_impl_Point";
      case 1362:
        return "c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__onHoveredGroupChanged_Group";
      case 1364:
        return "c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__posForIndicator_DropLocation";
      case 1367:
        return "c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__setCurrentDropLocation_DropLocation";
      case 668:
        return "c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__setParentView_impl_View";
      case 1376:
        return "c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__updateVisibility";
    }
    return super.cFunctionSymbolName(methodId);
  }

  static String methodNameFromId(int methodId) {
    switch (methodId) {
      case 1348:
        return "dropIndicatorVisible";
      case 1352:
        return "hover_impl";
      case 1362:
        return "onHoveredGroupChanged";
      case 1364:
        return "posForIndicator";
      case 1367:
        return "setCurrentDropLocation";
      case 668:
        return "setParentView_impl";
      case 1376:
        return "updateVisibility";
    }
    throw Error();
  }

  void registerCallbacks() {
    assert(thisCpp != null);
    final RegisterMethodIsReimplementedCallback registerCallback = _dylib
        .lookup<ffi.NativeFunction<RegisterMethodIsReimplementedCallback_FFI>>(
            'c_KDDockWidgets__Core__ClassicDropIndicatorOverlay__registerVirtualMethodCallback')
        .asFunction();
    const callbackExcept1348 = 0;
    final callback1348 =
        ffi.Pointer.fromFunction<bool_Func_voidstar_ffi_Int32_FFI>(
            DropIndicatorOverlay.dropIndicatorVisible_calledFromC,
            callbackExcept1348);
    registerCallback(thisCpp, callback1348, 1348);
    const callbackExcept1352 = 0;
    final callback1352 =
        ffi.Pointer.fromFunction<int_Func_voidstar_voidstar_FFI>(
            KDDWBindingsCore.ClassicDropIndicatorOverlay.hover_impl_calledFromC,
            callbackExcept1352);
    registerCallback(thisCpp, callback1352, 1352);
    final callback1362 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            DropIndicatorOverlay.onHoveredGroupChanged_calledFromC);
    registerCallback(thisCpp, callback1362, 1362);
    final callback1364 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsCore
                .ClassicDropIndicatorOverlay.posForIndicator_calledFromC);
    registerCallback(thisCpp, callback1364, 1364);
    final callback1367 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsCore.ClassicDropIndicatorOverlay
                .setCurrentDropLocation_calledFromC);
    registerCallback(thisCpp, callback1367, 1367);
    final callback668 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsCore.Controller.setParentView_impl_calledFromC);
    registerCallback(thisCpp, callback668, 668);
    final callback1376 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsCore
            .ClassicDropIndicatorOverlay.updateVisibility_calledFromC);
    registerCallback(thisCpp, callback1376, 1376);
  }
}
