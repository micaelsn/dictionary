import 'package:dartz/dartz.dart';
import 'package:dictionary/app/modules/home/domain/entities/word.dart';
import 'package:dictionary/shared/helpers/main.dart';

import '../repositories/word_repository.dart';

abstract class IWordUseCase {
  Future<Either<Failure, Word>> call({required String word});
}

class WordUseCaseImpl implements IWordUseCase {
  IWordRepository repository;

  WordUseCaseImpl(
    this.repository,
  );

  @override
  Future<Either<Failure, Word>> call({required String word}) async =>
      await repository.getWord(word);
}
