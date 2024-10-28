import "dart:convert";

import "package:caed_app/global/logs/common_attritbutes/log_class.dart";
import "package:caed_app/global/logs/log_manager/log_manager.dart";
import "package:caed_app/global/logs/transports/debug_console_transport.dart";
import "package:caed_app/model/enums/log_level.dart";
import "package:flutter/foundation.dart";

class LogService {
  @visibleForTesting
  final logManager = LogManager();

  void initialize() {
    logManager.addTransport(DebugConsoleTransport());
    logManager.initialize();
  }

  LogEvent protectUserInfos(LogEvent logEvent) {
    return logEvent;
  }

  Future<void> log(LogEvent logEvent) async {
    final Map<String, dynamic> attributes = {
      ...jsonDecode(jsonEncode(logEvent.attributes)) as Map<String, dynamic>,
    };
    final logEventHydrated =
        protectUserInfos(logEvent.copyWith(attributes: attributes));

    switch (logEvent.logLevel) {
      case LogLevel.info:
        logManager.info(logEventHydrated);
        break;
      case LogLevel.error:
        logManager.error(logEventHydrated);
        break;
      case LogLevel.warning:
        logManager.warning(logEventHydrated);
        break;
    }
  }

  void identifyUser(String id) {
    logManager.identifyUser(id);
  }
}
