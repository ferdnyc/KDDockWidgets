/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "fatal_logger.h"
#include "core/Logging_p.h"
#include "core/Platform.h"

#include <QDebug>

using namespace KDDockWidgets;

FatalLogger::~FatalLogger() = default;

void FatalLogger::log(const spdlog::details::log_msg &msg)
{
    spdlog::sinks::stdout_color_sink_mt::log(msg);
    if (msg.level < spdlog::level::err)
        return;

    const QString text = QString::fromUtf8(msg.payload.data());
    if (text.contains(Core::Platform::s_expectedWarning))
        return;

    spdlog::critical("KDDockWidgets should be error free. Aborting tests.");
    std::terminate();
}

std::shared_ptr<spdlog::logger> FatalLogger::create()
{
    if (spdlog::get(KDDockWidgets::spdlogLoggerName())) {
        // doesn't happen
        spdlog::critical("Tests bug, install the FatalLogger earlier.");
        std::terminate();
    }

    auto logger = std::make_shared<spdlog::logger>(KDDockWidgets::spdlogLoggerName(), std::make_shared<FatalLogger>());
    spdlog::register_logger(logger);

    return logger;
}
