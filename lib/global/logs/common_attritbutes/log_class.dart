import "package:caed_app/model/enums/log_level.dart";
import "package:caed_app/model/enums/log_type.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "log_class.freezed.dart";
part "log_class.g.dart";

@freezed
class LogError with _$LogError {
  const factory LogError({
    @ObjectSerializable() Object? error,
    @StackTraceSerializable() StackTrace? stack,
  }) = _LogError;

  factory LogError.fromJson(Map<String, Object?> json) =>
      _$LogErrorFromJson(json);
}

@freezed
class LogEvent with _$LogEvent {
  const factory LogEvent({
    required LogLevel logLevel,
    required String description,
    @Default(LogType.log) LogType type,
    @Default({}) Map<String, dynamic> attributes,
    LogError? error,
  }) = _LogEvent;

  factory LogEvent.fromJson(Map<String, Object?> json) =>
      _$LogEventFromJson(json);
}

class StackTraceSerializable implements JsonConverter<StackTrace, String> {
  const StackTraceSerializable();

  @override
  StackTrace fromJson(String json) => StackTrace.fromString(json);

  @override
  String toJson(StackTrace object) => object.toString();
}

class ObjectSerializable implements JsonConverter<Object, String> {
  const ObjectSerializable();

  @override
  Object fromJson(String json) => {};

  @override
  String toJson(Object object) => object.toString();
}
