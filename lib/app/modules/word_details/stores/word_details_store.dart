import 'package:dictionary/shared/common/main.dart';
import 'package:dictionary/shared/helpers/errors.dart';
import 'package:dictionary/shared/storage/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../home/domain/usecases/word_usecase.dart';

class WordDetailsStore extends NotifierStore<Failure, List<Word>> {
  final storage = Modular.get<IStorageApp>();
  final IWordUseCase useCase;
  ValueNotifier isFavorited = ValueNotifier(false);
  WordDetailsStore(this.useCase) : super([]);

  Future<void> getWords(String word) async {
    setLoading(true);

    var result = await useCase(word: word);
    result.fold((l) => setError(l), (r) {
      update(r);
    });

    setLoading(false);
  }

  Future<void> validateFavoriteWord(String word) async {
    var map = await storage.select('favorites');

    if (map?[word] != null) {
      isFavorited.value = true;
    }
  }

  void addToFavorites() {
    if (state.isNotEmpty) {
      if (isFavorited.value) {
        storage.delete('favorites', state[0].word!);
        isFavorited.value = false;
      } else {
        storage.put('favorites', state[0].word!);
        isFavorited.value = true;
      }
    }
  }
}
