import "package:caed_app/global/logs/common_attritbutes/log_class.dart";
import "package:flutter/material.dart";

abstract class LogManagerTransport {
  ///
  Future<void> identifyUser(String id);

  ///
  Future<void> initialize();

  ///
  Future<void> info(LogEvent log);

  ///
  Future<void> error(LogEvent log);

  ///
  Future<void> warning(LogEvent log);
}

class LogManager {
  @visibleForTesting
  final List<LogManagerTransport> transports = [];

  /// Add transport to the logger
  void addTransport(LogManagerTransport transport) {
    transports.add(transport);
  }

  void initialize() {
    for (final transport in transports) {
      transport.initialize();
    }
  }

  void info(LogEvent log) {
    for (final transport in transports) {
      transport.info(log);
    }
  }

  void error(LogEvent log) {
    for (final transport in transports) {
      transport.error(log);
    }
  }

  void warning(LogEvent log) {
    for (final transport in transports) {
      transport.warning(log);
    }
  }

  void identifyUser(String id) {
    for (final transport in transports) {
      transport.identifyUser(id);
    }
  }
}
