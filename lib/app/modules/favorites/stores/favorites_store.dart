import 'package:dictionary/shared/helpers/main.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../shared/storage/main.dart';

class FavoritesStore extends NotifierStore<Failure, List<String>> {
  final storage = Modular.get<IStorageApp>();
  FavoritesStore() : super([]) {
    getWords();
  }

  Future<void> getWords() async {
    setLoading(true);

    var map = await storage.select('favorites');

    update(map?.values.map((e) => e.toString()).toList() ?? []);
    setLoading(false);
  }
}
