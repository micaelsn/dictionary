import 'package:flutter_modular/flutter_modular.dart';
import '../favorites/favorites_module.dart';
import '../history/history_module.dart';
import '../word_list/word_list_module.dart';
import 'stores/home_store.dart';

import 'presenter/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage(), children: [
      ModuleRoute('/word-list', module: WordListModule()),
      ModuleRoute('/history', module: HistoryModule()),
      ModuleRoute('/favorites', module: FavoritesModule()),
    ]),
  ];
}
