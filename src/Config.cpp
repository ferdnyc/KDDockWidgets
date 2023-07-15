/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

/**
 * @file
 * @brief Application wide config to tune certain beahviours of the framework.
 *
 * @author Sérgio Martins \<sergio.martins@kdab.com\>
 */

#include "Config.h"
#include "core/layouting/Item_p.h"
#include "core/DockRegistry.h"
#include "core/DockRegistry_p.h"
#include "core/Utils_p.h"
#include "core/DragController_p.h"
#include "core/ViewFactory.h"
#include "core/Separator.h"
#include "core/Platform.h"
#include "core/View.h"

#include <iostream>
#include <limits>

using namespace KDDockWidgets::Core;

namespace KDDockWidgets {

class Config::Private
{
public:
    Private()
        : m_viewFactory(Platform::instance()->createDefaultViewFactory())
    {
    }

    ~Private()
    {
        delete m_viewFactory;
    }

    void fixFlags();

    DockWidgetFactoryFunc m_dockWidgetFactoryFunc = nullptr;
    MainWindowFactoryFunc m_mainWindowFactoryFunc = nullptr;
    TabbingAllowedFunc m_tabbingAllowedFunc = nullptr;
    DropIndicatorAllowedFunc m_dropIndicatorAllowedFunc = nullptr;
    ViewFactory *m_viewFactory = nullptr;
    Flags m_flags = Flag_Default;
    InternalFlags m_internalFlags = InternalFlag_None;
    CustomizableWidgets m_disabledPaintEvents = CustomizableWidget_None;
    double m_draggedWindowOpacity = std::numeric_limits<double>::quiet_NaN();
    bool m_transparencyOnlyOverDropIndicator = false;
    int m_mdiPopupThreshold = 250;
    int m_startDragDistance = -1;
    bool m_dropIndicatorsInhibited = false;
};

Config::Config()
    : d(new Private())
{
    d->fixFlags();
}

Config &Config::self()
{
    static Config config;
    return config;
}

Config::~Config()
{
    delete d;
}

Config::Flags Config::flags() const
{
    return d->m_flags;
}

void Config::setFlags(Flags f)
{
    auto dr = DockRegistry::self();
    if (!dr->isEmpty(/*excludeBeingDeleted=*/true)) {
        std::cerr
            << "Config::setFlags: "
            << "Only use this function at startup before creating any DockWidget or MainWindow"
            << "; These are already created: " << dr->mainWindowsNames().size() << dr->dockWidgetNames().size()
            << dr->floatingWindows().size() << "\n";
        return;
    }

    d->m_flags = f;
    d->fixFlags();
}

void Config::setDockWidgetFactoryFunc(DockWidgetFactoryFunc func)
{
    d->m_dockWidgetFactoryFunc = func;
}

DockWidgetFactoryFunc Config::dockWidgetFactoryFunc() const
{
    return d->m_dockWidgetFactoryFunc;
}

void Config::setMainWindowFactoryFunc(MainWindowFactoryFunc func)
{
    d->m_mainWindowFactoryFunc = func;
}

MainWindowFactoryFunc Config::mainWindowFactoryFunc() const
{
    return d->m_mainWindowFactoryFunc;
}

void Config::setViewFactory(ViewFactory *wf)
{
    assert(wf);
    delete d->m_viewFactory;
    d->m_viewFactory = wf;
}

ViewFactory *Config::viewFactory() const
{
    return d->m_viewFactory;
}

int Config::separatorThickness() const
{
    return Item::separatorThickness;
}

void Config::setSeparatorThickness(int value)
{
    if (!DockRegistry::self()->isEmpty(/*excludeBeingDeleted=*/true)) {
        std::cerr
            << "Config::setSeparatorThickness: Only use this function at startup before creating any DockWidget or MainWindow\n";
        return;
    }

    if (value < 0 || value >= 100) {
        std::cerr << "Config::setSeparatorThickness: Invalid value" << value << "\n";
        return;
    }

    Item::separatorThickness = value;
}

void Config::setDraggedWindowOpacity(double opacity)
{
    d->m_draggedWindowOpacity = opacity;
}

void Config::setTransparencyOnlyOverDropIndicator(bool only)
{
    d->m_transparencyOnlyOverDropIndicator = only;
}

double Config::draggedWindowOpacity() const
{
    return d->m_draggedWindowOpacity;
}

bool Config::transparencyOnlyOverDropIndicator() const
{
    return d->m_transparencyOnlyOverDropIndicator;
}

void Config::setTabbingAllowedFunc(TabbingAllowedFunc func)
{
    d->m_tabbingAllowedFunc = func;
}

TabbingAllowedFunc Config::tabbingAllowedFunc() const
{
    return d->m_tabbingAllowedFunc;
}

void Config::setDropIndicatorAllowedFunc(DropIndicatorAllowedFunc func)
{
    d->m_dropIndicatorAllowedFunc = func;
}

DropIndicatorAllowedFunc Config::dropIndicatorAllowedFunc() const
{
    return d->m_dropIndicatorAllowedFunc;
}

void Config::setAbsoluteWidgetMinSize(Size size)
{
    if (!DockRegistry::self()->isEmpty(/*excludeBeingDeleted=*/false)) {
        std::cerr
            << "Config::setAbsoluteWidgetMinSize: Only use this function at startup before creating any DockWidget or MainWindow\n";
        return;
    }

    Item::hardcodedMinimumSize = size;
}

Size Config::absoluteWidgetMinSize() const
{
    return Item::hardcodedMinimumSize;
}

void Config::setAbsoluteWidgetMaxSize(Size size)
{
    if (!DockRegistry::self()->isEmpty(/*excludeBeingDeleted=*/false)) {
        std::cerr
            << "Config::setAbsoluteWidgetMinSize: Only use this function at startup before creating any DockWidget or MainWindow\n";
        return;
    }

    Item::hardcodedMaximumSize = size;
}

Size Config::absoluteWidgetMaxSize() const
{
    return Item::hardcodedMaximumSize;
}

Config::InternalFlags Config::internalFlags() const
{
    return d->m_internalFlags;
}

void Config::setInternalFlags(InternalFlags flags)
{
    d->m_internalFlags = flags;
}

void Config::Private::fixFlags()
{
    if (Platform::instance()->supportsAeroSnap()) {
        // Unconditional now
        m_flags |= Flag_AeroSnapWithClientDecos;
    } else {
        m_flags = m_flags & ~Flag_AeroSnapWithClientDecos;
    }

    // These are mutually exclusive:
    if ((m_flags & Flag_AeroSnapWithClientDecos) && (m_flags & Flag_NativeTitleBar)) {
        // We're either using native or client decorations, let's use native.
        m_flags = m_flags & ~Flag_AeroSnapWithClientDecos;
    }

#if defined(Q_OS_LINUX)
    if (KDDockWidgets::isWayland()) {
        // Native title bar is forced on Wayland. Needed for moving the window.
        // The inner KDDW title bar is used for DnD.
        m_flags |= Flag_NativeTitleBar;
    } else {
        // On Linux, dragging the title bar of a window doesn't generate NonClientMouseEvents
        // at least with KWin anyway. We can make this more granular and allow it for other
        // X11 window managers
        m_flags = m_flags & ~Flag_NativeTitleBar;
    }
#endif

#if (!defined(KDDW_FRONTEND_QT_WINDOWS) && !defined(Q_OS_MACOS))
    // QtQuick doesn't support AeroSnap yet. Some problem with the native events not being
    // received...
    m_flags = m_flags & ~Flag_AeroSnapWithClientDecos;
#endif


#if defined(DOCKS_DEVELOPER_MODE)
    // We allow to disable aero-snap during development
    if (m_internalFlags & InternalFlag_NoAeroSnap) {
        // The only way to disable AeroSnap
        m_flags = m_flags & ~Flag_AeroSnapWithClientDecos;
    }
#endif

    if (m_flags & Flag_DontUseUtilityFloatingWindows) {
        m_internalFlags |= InternalFlag_DontUseParentForFloatingWindows;
        m_internalFlags |= InternalFlag_DontUseQtToolWindowsForFloatingWindows;
    }

    if (m_flags & Flag_ShowButtonsOnTabBarIfTitleBarHidden) {
        // Flag_ShowButtonsOnTabBarIfTitleBarHidden doesn't make sense if used alone
        m_flags |= Flag_HideTitleBarWhenTabsVisible;
    }
}

void Config::setDisabledPaintEvents(CustomizableWidgets widgets)
{
    d->m_disabledPaintEvents = widgets;
}

Config::CustomizableWidgets Config::disabledPaintEvents() const
{
    return d->m_disabledPaintEvents;
}

void Config::setMDIPopupThreshold(int threshold)
{
    d->m_mdiPopupThreshold = threshold;
}

int Config::mdiPopupThreshold() const
{
    return d->m_mdiPopupThreshold;
}

void Config::setDropIndicatorsInhibited(bool inhibit) const
{
    if (d->m_dropIndicatorsInhibited != inhibit) {
        d->m_dropIndicatorsInhibited = inhibit;
        DockRegistry::self()->dptr()->dropIndicatorsInhibitedChanged.emit(inhibit);
    }
}

bool Config::dropIndicatorsInhibited() const
{
    return d->m_dropIndicatorsInhibited;
}

void Config::setStartDragDistance(int pixels)
{
    d->m_startDragDistance = pixels;
}

int Config::startDragDistance() const
{
    return d->m_startDragDistance;
}

void Config::printDebug()
{
    std::cerr << "Flags: " << d->m_flags << d->m_internalFlags << "\n";
}

}
