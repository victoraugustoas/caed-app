import "package:freezed_annotation/freezed_annotation.dart";

enum LogLevel {
  @JsonValue("info")
  info,
  @JsonValue("error")
  error,
  @JsonValue("warning")
  warning
}
