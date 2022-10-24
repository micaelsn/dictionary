import 'package:flutter_modular/flutter_modular.dart';

import '../favorites/favorites_module.dart';
import '../history/history_module.dart';
import '../word_details/word_details_module.dart';
import '../word_list/word_list_module.dart';
import 'data/external/datasources/word_datasource.dart';
import 'data/infra/datasource/word_datasource.dart';
import 'data/infra/repositories/word_repository.dart';
import 'domain/repositories/word_repository.dart';
import 'domain/usecases/word_usecase.dart';
import 'presenter/home_page.dart';
import 'stores/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<IWordDatasource>((i) => WordDatasource(i())),
    Bind.factory<IWordRepository>((i) => WordRepository(i())),
    Bind.factory<IWordUseCase>((i) => WordUseCase(i())),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage(), children: [
      ModuleRoute('/word-list', module: WordListModule()),
      ModuleRoute('/history', module: HistoryModule()),
      ModuleRoute('/favorites', module: FavoritesModule()),
    ]),
    ModuleRoute('/word-details', module: WordDetailsModule())
  ];
}
