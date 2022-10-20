import 'package:dartz/dartz.dart';
import 'package:dictionary/shared/common/main.dart';
import 'package:dictionary/shared/helpers/main.dart';

import '../repositories/word_repository.dart';

abstract class IWordUseCase {
  Future<Either<Failure, List<Word>>> call({required String word});
}

class WordUseCase implements IWordUseCase {
  IWordRepository repository;

  WordUseCase(
    this.repository,
  );

  @override
  Future<Either<Failure, List<Word>>> call({required String word}) async =>
      await repository.getWord(word);
}
