import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/api/main.dart';
import '../shared/storage/storage.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IClientAPI>((i) => ClientAPI(Dio(), Api().baseUrl)),
    Bind.lazySingleton<IStorageApp>((i) => StorageApp()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
