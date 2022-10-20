import 'package:flutter_modular/flutter_modular.dart';
import 'stores/word_list_store.dart';

import 'presenter/word_list_page.dart';

class WordListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WordListStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => WordListPage()),
  ];
}
