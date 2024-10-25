import 'package:caed_app/global/container/dependency_injection.dart';
import 'package:get_it/get_it.dart';

class GetItDIProvider implements DependenciInjection {
  @override
  T find<T extends Object>() {
    return GetIt.I.get<T>();
  }

  @override
  T putIfAbsent<T extends Object>(T instance) {
    if (!GetIt.I.isRegistered<T>()) {
      GetIt.I.registerSingleton<T>(instance);
    }
    return find<T>();
  }
}
