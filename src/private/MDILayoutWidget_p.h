/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2020-2022 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/



#ifndef KDDOCKWIDGETS_MDI_LAYOUT_WIDGET_P_H
#define KDDOCKWIDGETS_MDI_LAYOUT_WIDGET_P_H

#include "Layout.h"
#include "kddockwidgets/KDDockWidgets.h"
#include "kddockwidgets/docks_export.h"

#include "qtwidgets/views/View_qtwidgets.h"

namespace Layouting {
class ItemFreeContainer;
}

// TODOv2: Move to controllers/

namespace KDDockWidgets {

/**
 * @brief The MDILayoutWidget class implements a layout suitable for MDI style docking.
 * Where dock widgets are free to be positioned in arbitrary positions, not restricted by layouting.
 */
class DOCKS_EXPORT MDILayout : public LayoutWidget
{
    Q_OBJECT
public:
    explicit MDILayout(View *parent = nullptr);
    ~MDILayout() override;

    /// @brief docks the dock widgets into this MDI area, at the specified position
    void addDockWidget(Controllers::DockWidget *dw, QPoint localPt, InitialOption addingOption = {});

    /// @brief Moves a dock widget @p dw to point @p pos
    void moveDockWidget(Controllers::DockWidget *dw, QPoint pos);

    /// @brief Moves a dock widget @p f to point @p pos
    /// Convenience overload.
    void moveDockWidget(Controllers::Frame *f, QPoint pos);

    /// @brief Sets the size of dock widget @p dw to @p size
    void resizeDockWidget(Controllers::DockWidget *dw, QSize size);

    /// @brief Sets the size of dock widget @p f to @p size
    /// Convenience overload.
    void resizeDockWidget(Controllers::Frame *f, QSize size);

    /// @brief sets the size and position of the dock widget @p f
    void setDockWidgetGeometry(Controllers::Frame *f, QRect);

private:
    Layouting::ItemFreeContainer *const m_rootItem;
};

}

#endif
