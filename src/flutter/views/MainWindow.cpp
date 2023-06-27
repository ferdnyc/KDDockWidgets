/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "MainWindow.h"
#include "kddockwidgets/core/MainWindow.h"
#include "core/Logging_p.h"

using namespace KDDockWidgets::flutter;

MainWindow::MainWindow(const QString &uniqueName, MainWindowOptions options,
                       flutter::View *parent, Qt::WindowFlags flags)
    : View(new Core::MainWindow(this, uniqueName, options), Core::ViewType::MainWindow, parent,
           flags)
    , MainWindowViewInterface(static_cast<Core::MainWindow *>(View::controller()))
{
}

MainWindow::~MainWindow()
{
}

QMargins MainWindow::centerWidgetMargins() const
{
    KDDW_WARN("SideBar hasn't been implemented yet {}", Q_FUNC_INFO);
    return {};
}

QRect MainWindow::centralAreaGeometry() const
{
    KDDW_WARN("MainWindow::centralAreaGeometry hasn't been implemented {}", Q_FUNC_INFO);
    return {};
}

void MainWindow::setContentsMargins(int left, int top, int right, int bottom)
{
    KDDW_UNUSED(left);
    KDDW_UNUSED(right);
    KDDW_UNUSED(top);
    KDDW_UNUSED(bottom);
    KDDW_WARN("MainWindow::setContentsMargins hasn't been implemented {}", Q_FUNC_INFO);
}
