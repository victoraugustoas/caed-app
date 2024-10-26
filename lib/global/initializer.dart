import "package:caed_app/global/container/dependency_injection.dart";
import "package:caed_app/global/container/provider/get_it_provider.dart";
import "package:caed_app/global/http/network_module.dart";
import "package:caed_app/global/http/providers/dio_http_client.dart";
import "package:caed_app/network/providers/auth_data_provider.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "initializer.g.dart";

@riverpod
class Initializer extends _$Initializer {
  final DependenciInjection dependenciInjection = GetItDIProvider();

  @override
  FutureOr<void> build() {}

  Future<void> initialize() async {
    state = const AsyncLoading();

    final dio = NetworkModule().provideDio();
    final httpClient = DioHttpClient(dio);

    // Data providers
    dependenciInjection.putIfAbsent(AuthDataProvider(httpClient: httpClient));

    // Services
    // TODO add here app services

    await Future.delayed(const Duration(seconds: 1));
    state = const AsyncData(null);
  }
}
