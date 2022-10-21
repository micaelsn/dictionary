import 'package:flutter_modular/flutter_modular.dart';
import 'stores/word_details_store.dart';

import 'presenter/word_details_page.dart';

class WordDetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WordDetailsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/:word",
        child: (_, args) => WordDetailsPage(word: args.params["word"])),
  ];
}
