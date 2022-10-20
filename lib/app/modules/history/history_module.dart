import 'package:flutter_modular/flutter_modular.dart';
import 'stores/history_store.dart';

import 'presenter/history_page.dart';

class HistoryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HistoryStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HistoryPage()),
  ];
}
