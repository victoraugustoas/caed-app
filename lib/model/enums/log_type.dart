import "package:freezed_annotation/freezed_annotation.dart";

enum LogType {
  @JsonValue("navigation")
  navigation,
  @JsonValue("log")
  log,
  @JsonValue("error")
  error,
  @JsonValue("http_request")
  httpRequest,
  @JsonValue("http_response")
  httpResponse,
  @JsonValue("http_error")
  httpError
}
