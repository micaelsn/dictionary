import 'dart:convert';

import 'package:dictionary/shared/common/main.dart';
import 'package:dictionary/shared/helpers/errors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../home/domain/usecases/word_usecase.dart';

class WordDetailsStore extends NotifierStore<Failure, List<Word>> {
  final IWordUseCase useCase;
  WordDetailsStore(this.useCase) : super([]);

  Future<void> getWords(String word) async {
    setLoading(true);

    var result = await useCase(word: word);
    result.fold((l) => setError(l), (r) {
      update(r);
      print(r.length);
    });

    setLoading(false);
  }
}
