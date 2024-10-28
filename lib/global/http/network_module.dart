import "package:caed_app/global/container/provider/get_it_provider.dart";
import "package:caed_app/global/http/endpoints.dart";
import "package:caed_app/global/logs/common_attritbutes/log_class.dart";
import "package:caed_app/global/logs/logs.dart";
import "package:caed_app/model/enums/log_level.dart";
import "package:caed_app/model/enums/log_type.dart";
import "package:caed_app/utils/extensions/uri_ext.dart";
import "package:dio/dio.dart";

class NetworkModule {
  Dio provideDio() {
    final dio = Dio();
    dio
      ..options.baseUrl = Endpoints.url.str
      ..options.connectTimeout = Endpoints.generalTimeout
      ..options.receiveTimeout = Endpoints.generalTimeout
      ..options.sendTimeout = Endpoints.generalTimeout
      ..options.headers = {"Content-Type": "application/json; charset=utf-8"};

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );

    return dio;
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    GetItDIProvider().find<LogService>().log(
          LogEvent(
            logLevel: LogLevel.info,
            description: "onRequest",
            type: LogType.httpRequest,
            attributes: {
              "url": options.uri.toString(),
              "data": options.data,
              "method": options.method
            },
          ),
        );
    return handler.next(options);
  }

  void _onResponse(
    Response<dynamic> e,
    ResponseInterceptorHandler handler,
  ) {
    GetItDIProvider().find<LogService>().log(
          LogEvent(
            logLevel: LogLevel.info,
            description: "onResponse",
            type: LogType.httpRequest,
            attributes: {
              "url": e.requestOptions.uri.toString(),
              "data": e.data,
              "statusCode": e.statusCode,
              "statusMessage": e.statusMessage,
            },
          ),
        );
    handler.next(e);
  }

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    GetItDIProvider().find<LogService>().log(
          LogEvent(
            logLevel: LogLevel.error,
            type: LogType.httpError,
            error: LogError(error: error, stack: error.stackTrace),
            description: "onError",
            attributes: {
              "url": error.requestOptions.uri.toString(),
              "data": error.requestOptions.data,
              "statusCode": error.response?.statusCode,
              "statusMessage": error.response?.statusMessage,
              "message": error.message,
              "error_type": error.type.toString()
            },
          ),
        );
    return handler.next(error);
  }
}
