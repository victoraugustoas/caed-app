import "package:freezed_annotation/freezed_annotation.dart";

part "http_exception.freezed.dart";

@freezed
class HttpException with _$HttpException {
  factory HttpException({
    required String message,
    required int statusCode,
    required StackTrace stackTrace,
  }) = _HttpException;
}
