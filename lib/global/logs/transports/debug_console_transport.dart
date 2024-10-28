import "dart:convert";
import "dart:developer";

import "package:caed_app/global/logs/common_attritbutes/log_class.dart";
import "package:caed_app/global/logs/log_manager/log_manager.dart";

class DebugConsoleTransport implements LogManagerTransport {
  static const JsonEncoder _encoder = JsonEncoder.withIndent("  ");

  @override
  Future<void> info(LogEvent logEvent) async {
    final encode = _encoder.convert(logEvent.toJson());
    log(encode, name: "debug_console");
  }

  @override
  Future<void> error(LogEvent logEvent) async {
    log(
      _encoder.convert(logEvent.toJson()),
      name: "debug_console_error",
    );
  }

  @override
  Future<void> warning(LogEvent logEvent) async {
    log(
      _encoder.convert(logEvent.toJson()),
      name: "debug_console_warning",
    );
  }

  @override
  Future<void> identifyUser(String id) async {}

  @override
  Future<void> initialize() async {}
}
