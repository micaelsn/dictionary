import 'dart:convert';

import 'package:dictionary/shared/common/main.dart';
import 'package:dictionary/shared/helpers/main.dart';
import 'package:dictionary/shared/storage/main.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:hive_flutter/adapters.dart';

class HistoryStore extends NotifierStore<Failure, List<String>> {
  final storage = Modular.get<IStorageApp>();

  HistoryStore() : super([]) {
    getWords();
  }

  Future<void> getWords() async {
    setLoading(true);

    var map = await storage.select('history');

    update(map?.values.map((e) => e.toString()).toList() ?? []);
    setLoading(false);
  }

  void removeHistory() {
    setLoading(true);
    storage.deleteAll('history');
    update([]);
    setLoading(false);
  }
}
