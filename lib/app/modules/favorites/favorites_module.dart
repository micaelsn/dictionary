import 'package:flutter_modular/flutter_modular.dart';
import 'stores/favorites_store.dart';

import 'presenter/favorites_page.dart';

class FavoritesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FavoritesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => FavoritesPage()),
  ];
}
