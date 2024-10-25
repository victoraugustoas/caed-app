import "package:caed_app/global/http/endpoints.dart";
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
    // TODO add here logs
    return handler.next(options);
  }

  void _onResponse(
    Response<dynamic> e,
    ResponseInterceptorHandler handler,
  ) {
    // TODO add here logs
    handler.next(e);
  }

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    // TODO add here logs
    return handler.next(error);
  }
}
