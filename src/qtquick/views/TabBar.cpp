/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
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

#include "TabBar.h"
#include "Stack.h"
#include "core/DockWidget_p.h"
#include "kddockwidgets/core/TabBar.h"
#include "kddockwidgets/core/Stack.h"
#include "core/ScopedValueRollback_p.h"
#include "core/TabBar_p.h"
#include "core/Logging_p.h"

#include <QMetaObject>
#include <QMouseEvent>
#include <QDebug>

#include <unordered_map>

using namespace KDDockWidgets;
using namespace KDDockWidgets::QtQuick;


class DockWidgetModel::Private
{
public:
    explicit Private(Core::TabBar *tabBar)
        : m_tabBar(tabBar)
    {
    }

    Core::TabBar *const m_tabBar = nullptr;
    QVector<Core::DockWidget *> m_dockWidgets;
    QHash<Core::DockWidget *, QMetaObject::Connection>
        m_connections; // TODOm4  Remove once ported away from QObject

    std::unordered_map<Core::DockWidget *, KDBindings::ScopedConnection>
        m_connections2;

    bool m_removeGuard = false;
    Core::DockWidget *m_currentDockWidget = nullptr;
};

TabBar::TabBar(Core::TabBar *controller, QQuickItem *parent)
    : View(controller, Core::ViewType::TabBar, parent)
    , TabBarViewInterface(controller)
    , m_dockWidgetModel(new DockWidgetModel(controller, this))
{
    connect(m_dockWidgetModel, &DockWidgetModel::countChanged, this,
            [controller] { controller->dptr()->countChanged.emit(); });
}

void TabBar::init()
{
    m_tabBarAutoHideChanged = m_tabBar->stack()->tabBarAutoHideChanged.connect(
        [this] { Q_EMIT tabBarAutoHideChanged(); });
}

int TabBar::tabAt(QPoint localPt) const
{
    // QtQuick's TabBar doesn't provide any API for this.
    // Also note that the ListView's flickable has bogus contentX, so instead just iterate through
    // the tabs

    if (!m_tabBarQmlItem) {
        qWarning() << Q_FUNC_INFO << "No visual tab bar item yet";
        return -1;
    }

    const QPointF globalPos = m_tabBarQmlItem->mapToGlobal(localPt);

    QVariant index;
    const bool res =
        QMetaObject::invokeMethod(m_tabBarQmlItem, "getTabIndexAtPosition",
                                  Q_RETURN_ARG(QVariant, index), Q_ARG(QVariant, globalPos));

    if (res)
        return index.toInt();

    return -1;
}

QQuickItem *TabBar::tabBarQmlItem() const
{
    return m_tabBarQmlItem;
}

void TabBar::setTabBarQmlItem(QQuickItem *item)
{
    if (m_tabBarQmlItem == item) {
        qWarning() << Q_FUNC_INFO << "Should be called only once";
        return;
    }

    m_tabBarQmlItem = item;
    Q_EMIT tabBarQmlItemChanged();
}

QString TabBar::text(int index) const
{
    if (QQuickItem *item = tabAt(index))
        return item->property("text").toString();

    return {};
}

QRect TabBar::rectForTab(int index) const
{
    if (QQuickItem *item = tabAt(index))
        return item->boundingRect().toRect();

    return {};
}

QRect TabBar::globalRectForTab(int index) const
{
    if (QQuickItem *item = tabAt(index)) {
        QRect r = item->boundingRect().toRect();
        r.moveTopLeft(item->mapToGlobal(r.topLeft()).toPoint());
        return r;
    }

    return {};
}

bool TabBar::event(QEvent *ev)
{
    switch (ev->type()) {
    case QEvent::MouseButtonDblClick:
    case QEvent::MouseButtonPress: {
        if (m_tabBarQmlItem) {
            auto me = static_cast<QMouseEvent *>(ev);
            m_tabBarQmlItem->setProperty("currentTabIndex", tabAt(me->pos()));
            if (ev->type() == QEvent::MouseButtonPress)
                m_tabBar->onMousePress(me->pos());
            else
                m_tabBar->onMouseDoubleClick(me->pos());

            // Don't call base class, it might have been deleted
            return true;
        }

        break;
    }
    default:
        break;
    }

    return View::event(ev);
}

QQuickItem *TabBar::tabAt(int index) const
{
    QVariant result;
    const bool res = QMetaObject::invokeMethod(
        m_tabBarQmlItem, "getTabAtIndex", Q_RETURN_ARG(QVariant, result), Q_ARG(QVariant, index));

    if (res)
        return result.value<QQuickItem *>();

    qWarning() << Q_FUNC_INFO << "Could not find tab for index" << index;
    return nullptr;
}

void TabBar::moveTabTo(int from, int to)
{
    Q_UNUSED(from);
    Q_UNUSED(to);
    // Not implemented yet
}

bool TabBar::tabBarAutoHide() const
{
    return m_tabBar->stack()->tabBarAutoHide();
}

Stack *TabBar::stackView() const
{
    if (auto tw = dynamic_cast<Stack *>(m_tabBar->stack()->view()))
        return tw;

    qWarning() << Q_FUNC_INFO << "Unexpected null Stack_qtquick";
    return nullptr;
}

void TabBar::setCurrentIndex(int index)
{
    m_dockWidgetModel->setCurrentIndex(index);
}

void TabBar::renameTab(int index, const QString &)
{
    Q_UNUSED(index);
    qDebug() << Q_FUNC_INFO << "Not implemented";
}

void TabBar::changeTabIcon(int index, const QIcon &)
{
    Q_UNUSED(index);
    qDebug() << Q_FUNC_INFO << "Not implemented";
}

void TabBar::removeDockWidget(Core::DockWidget *dw)
{
    m_dockWidgetModel->remove(dw);
}

void TabBar::insertDockWidget(int index, Core::DockWidget *dw, const QIcon &icon,
                              const QString &title)
{
    Q_UNUSED(title); // TODO
    Q_UNUSED(icon); // TODO

    m_dockWidgetModel->insert(dw, index);
}

DockWidgetModel *TabBar::dockWidgetModel() const
{
    return m_dockWidgetModel;
}

void TabBar::onHoverEvent(QHoverEvent *ev, QPoint globalPos)
{
    if (ev->type() == QEvent::HoverLeave) {
        setHoveredTabIndex(-1);
    } else {
        setHoveredTabIndex(indexForTabPos(globalPos));
    }
}

int TabBar::indexForTabPos(QPoint globalPt) const
{
    const int count = m_dockWidgetModel->count();
    for (int i = 0; i < count; i++) {
        const QRect tabRect = globalRectForTab(i);
        if (tabRect.contains(globalPt))
            return i;
    }

    return -1;
}

void TabBar::setHoveredTabIndex(int idx)
{
    if (idx == m_hoveredTabIndex)
        return;

    m_hoveredTabIndex = idx;
    Q_EMIT hoveredTabIndexChanged(idx);
}

int TabBar::hoveredTabIndex() const
{
    return m_hoveredTabIndex;
}

DockWidgetModel::DockWidgetModel(Core::TabBar *tabBar, QObject *parent)
    : QAbstractListModel(parent)
    , d(new Private(tabBar))
{
}

DockWidgetModel::~DockWidgetModel()
{
    delete d;
}

int DockWidgetModel::count() const
{
    return d->m_dockWidgets.size();
}

int DockWidgetModel::rowCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : d->m_dockWidgets.size();
}

QVariant DockWidgetModel::data(const QModelIndex &index, int role) const
{
    const int row = index.row();
    if (row < 0 || row >= d->m_dockWidgets.size())
        return {};

    if (role == Role_Title) {
        Core::DockWidget *dw = d->m_dockWidgets.at(row);
        return dw->title();
    }

    return {};
}

Core::DockWidget *DockWidgetModel::dockWidgetAt(int index) const
{
    if (index < 0 || index >= d->m_dockWidgets.size()) {
        // Can happen. Benign.
        return nullptr;
    }

    return d->m_dockWidgets[index];
}

bool DockWidgetModel::contains(Core::DockWidget *dw) const
{
    return d->m_dockWidgets.contains(dw);
}

Core::DockWidget *DockWidgetModel::currentDockWidget() const
{
    return d->m_currentDockWidget;
}

void DockWidgetModel::setCurrentDockWidget(Core::DockWidget *dw)
{
    if (d->m_currentDockWidget)
        d->m_currentDockWidget->setVisible(false);

    d->m_currentDockWidget = dw;
    setCurrentIndex(indexOf(dw));
    if (d->m_currentDockWidget) {
        ScopedValueRollback guard(d->m_currentDockWidget->d->m_isSettingCurrent, true);
        d->m_currentDockWidget->setVisible(true);
    }
}

QHash<int, QByteArray> DockWidgetModel::roleNames() const
{
    return { { Role_Title, "title" } };
}

void DockWidgetModel::emitDataChangedFor(Core::DockWidget *dw)
{
    const int row = indexOf(dw);
    if (row == -1) {
        qWarning() << Q_FUNC_INFO << "Couldn't find" << dw;
    } else {
        QModelIndex index = this->index(row, 0);
        Q_EMIT dataChanged(index, index);
    }
}

void DockWidgetModel::remove(Core::DockWidget *dw)
{
    ScopedValueRollback guard(d->m_removeGuard, true);
    const int row = indexOf(dw);

    if (row == -1) {
        if (!d->m_removeGuard) {
            // can happen if there's reentrancy. Some user code reacting
            // to the signals and call remove for whatever reason.
            qWarning() << Q_FUNC_INFO << "Nothing to remove"
                       << static_cast<void *>(dw); // Print address only, as it might be deleted
                                                   // already
        }
    } else {
        disconnect(d->m_connections.take(dw));
        auto it = d->m_connections2.find(dw);
        if (it != d->m_connections2.end())
            d->m_connections2.erase(it);

        beginRemoveRows(QModelIndex(), row, row);
        d->m_dockWidgets.removeOne(dw);
        endRemoveRows();

        Q_EMIT countChanged();
        Q_EMIT dockWidgetRemoved();
    }
}

int DockWidgetModel::indexOf(const Core::DockWidget *dw)
{
    return d->m_dockWidgets.indexOf(const_cast<Core::DockWidget *>(dw));
}

int DockWidgetModel::currentIndex() const
{
    if (!d->m_currentDockWidget)
        return -1;

    const int index = d->m_dockWidgets.indexOf(d->m_currentDockWidget);

    if (index == -1)
        qWarning() << Q_FUNC_INFO << "Unexpected null index for" << d->m_currentDockWidget << this
                   << "; count=" << count();

    return index;
}

void DockWidgetModel::setCurrentIndex(int index)
{
    Core::DockWidget *dw = dockWidgetAt(index);

    if (d->m_currentDockWidget != dw) {
        setCurrentDockWidget(dw);
        d->m_tabBar->setCurrentIndex(index);
    }
}

bool DockWidgetModel::insert(Core::DockWidget *dw, int index)
{
    if (d->m_dockWidgets.contains(dw)) {
        qWarning() << Q_FUNC_INFO << "Shouldn't happen";
        return false;
    }

    KDBindings::ScopedConnection titleChangedConnection = dw->d->titleChanged.connect([dw, this] { emitDataChangedFor(dw); });

    QMetaObject::Connection destroyedConnection =
        connect(dw, &QObject::destroyed, this, [dw, this] { remove(dw); });

    d->m_connections[dw] = destroyedConnection;
    d->m_connections2[dw] = std::move(titleChangedConnection);

    beginInsertRows(QModelIndex(), index, index);
    d->m_dockWidgets.insert(index, dw);
    endInsertRows();

    Q_EMIT countChanged();
    return true;
}
