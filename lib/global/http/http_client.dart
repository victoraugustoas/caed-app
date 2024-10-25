abstract class HttpClient {
  Future<T> get<T>(String url);
  Future<T> post<T>(String url, Map<String, dynamic> data);
}
