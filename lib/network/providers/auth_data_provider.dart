import 'package:caed_app/global/http/http_client.dart';
import 'package:caed_app/network/endpoints/auth_endpoints.dart';
import 'package:caed_app/utils/extensions/uri_ext.dart';

class AuthDataProvider {
  final HttpClient httpClient;

  AuthDataProvider({required this.httpClient});

  Future<void> signin(String username, String password) async {
    try {
      await httpClient.post(
        AuthEndpoints.signin.str,
        {"username": username, "password": password},
      );
    } catch (e) {
      rethrow;
    }
  }
}
