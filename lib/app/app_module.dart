import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/api/main.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientAPI(Dio(), Api().baseUrl)),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
