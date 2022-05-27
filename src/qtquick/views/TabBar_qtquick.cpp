/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2022 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

/**
 * @file
 * @brief Implements a QTabWidget derived class with support for docking and undocking
 * KDockWidget::DockWidget as tabs .
 *
 * @author Sérgio Martins \<sergio.martins@kdab.com\>
 */

#include "TabBar_qtquick.h"
#include "controllers/TabBar.h"

#include <QMetaObject>
#include <QMouseEvent>

using namespace KDDockWidgets;
using namespace KDDockWidgets::Views;

TabBar_qtquick::TabBar_qtquick(Controllers::TabBar *controller, QQuickItem *parent)
    : View_qtquick(controller, Type::TabBar, parent)
    , m_controller(controller)
{
}

int TabBar_qtquick::tabAt(QPoint p) const
{
    // QtQuick's TabBar doesn't provide any API for this.
    // So ask its *internal* ListView instead.

    if (!m_tabBarQmlItem) {
        qWarning() << Q_FUNC_INFO << "No visual tab bar item yet";
        return -1;
    }

    if (QQuickItem *internalListView = listView()) {
        int index = -1;
        QMetaObject::invokeMethod(internalListView, "indexAt", Q_RETURN_ARG(int, index),
                                  Q_ARG(double, p.x()), Q_ARG(double, p.y()));

        return index;
    } else {
        qWarning() << Q_FUNC_INFO << "Couldn't find the internal ListView";
    }

    return -1;
}

QQuickItem *TabBar_qtquick::tabBarQmlItem() const
{
    return m_tabBarQmlItem;
}

void TabBar_qtquick::setTabBarQmlItem(QQuickItem *item)
{
    m_tabBarQmlItem = item;
}

QString TabBar_qtquick::text(int index) const
{
    if (QQuickItem *item = tabAt(index))
        return item->property("text").toString();

    return {};
}

QRect TabBar_qtquick::rectForTab(int index) const
{
    if (QQuickItem *item = tabAt(index))
        return item->boundingRect().toRect();

    return {};
}

bool TabBar_qtquick::event(QEvent *ev)
{
    switch (ev->type()) {
    case QEvent::MouseButtonDblClick:
    case QEvent::MouseButtonPress: {
        if (m_tabBarQmlItem) {
            auto me = static_cast<QMouseEvent *>(ev);
            m_tabBarQmlItem->setProperty("currentIndex", tabAt(me->pos()));
            if (ev->type() == QEvent::MouseButtonPress)
                m_controller->onMousePress(me->pos());
            else
                m_controller->onMouseDoubleClick(me->pos());
        }

        break;
    }
    default:
        break;
    }

    return View_qtquick::event(ev);
}

QQuickItem *TabBar_qtquick::tabAt(int index) const
{
    QQuickItem *view = listView();
    if (!view)
        return nullptr;

    QQuickItem *item = nullptr;
    QMetaObject::invokeMethod(view, "itemAtIndex", Q_RETURN_ARG(QQuickItem *, item),
                              Q_ARG(int, index));

    return item;
}

QQuickItem *TabBar_qtquick::listView() const
{
    // Returns the internal ListView of the TabBar

    if (!m_tabBarQmlItem)
        return nullptr;

    const QList<QQuickItem *> children = m_tabBarQmlItem->childItems();
    for (QQuickItem *child : children) {
        if (qstrcmp(child->metaObject()->className(), "QQuickListView") == 0)
            return child;
    }

    return nullptr;
}

void TabBar_qtquick::moveTabTo(int from, int to)
{
    Q_UNUSED(from);
    Q_UNUSED(to);
    // Not implemented yet
}

Controllers::DockWidget *TabBar_qtquick::currentDockWidget() const
{
    return nullptr;
}

bool TabBar_qtquick::tabsAreMovable() const
{
    qFatal("Not implemented");
    return false;
}