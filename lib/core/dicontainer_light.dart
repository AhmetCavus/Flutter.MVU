import 'dicontainer.dart';
import 'package:get_it/get_it.dart';

class DiContainerLight implements DiContainer {
  static final DiContainerLight _instance = DiContainerLight._();
  static DiContainerLight get instance => _instance;

  final _getIt = GetIt.instance;

  DiContainerLight._();

  @override
  void registerSingleton<T extends Object>(T instance, {String name = ""}) {
    if (name.isEmpty) {
      _getIt.registerSingleton<T>(instance);
    } else {
      _getIt.registerSingleton<T>(instance, instanceName: name);
    }
  }

  @override
  void registerFactory<T extends Object>(T instance, {String name = ""}) {
    if (name.isEmpty) {
      _getIt.registerFactory<T>(() => instance);
    } else {
      _getIt.registerFactory<T>(() => instance, instanceName: name);
    }
  }

  @override
  T resolveByName<T extends Object>(String name) {
    return _getIt.get<T>(instanceName: name);
  }

  @override
  T resolve<T extends Object>() {
    return _getIt.get<T>();
  }
}
