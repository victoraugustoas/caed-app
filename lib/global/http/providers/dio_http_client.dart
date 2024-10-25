import 'package:caed_app/global/http/http_client.dart';
import 'package:caed_app/utils/exceptions/http_exception.dart';
import 'package:dio/dio.dart';

class DioHttpClient implements HttpClient {
  Dio dio;

  DioHttpClient(this.dio);

  @override
  Future<T> get<T>(String url) async {
    try {
      final Response response = await dio.get(url);

      return response.data as T;
    } on DioException catch (e) {
      final networkError = _buildError(e);
      throw networkError;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<T> post<T>(String url, Map<String, dynamic> data) async {
    try {
      final Response response = await dio.post(url, data: data);
      return response.data as T;
    } on DioException catch (e) {
      final networkError = _buildError(e);
      throw networkError;
    } catch (e) {
      rethrow;
    }
  }

  HttpException _buildError(DioException error) {
    switch (error.type) {
      // TODO catch errors from dio
      default:
        return HttpException(
          message: error.message ?? "",
          statusCode: error.response?.statusCode ?? 0,
          stackTrace: error.stackTrace,
        );
    }
  }
}
