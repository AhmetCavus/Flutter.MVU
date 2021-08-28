abstract class DiContainer {
  void registerSingleton<T extends Object>(T instance, {String name: ""});
  void registerFactory<T extends Object>(T instance, {String name: ""});
  T resolveByName<T extends Object>(String name);
  T resolve<T extends Object>();
}
