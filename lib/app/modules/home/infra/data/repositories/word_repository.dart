import 'package:dartz/dartz.dart';
import 'package:dictionary/shared/helpers/main.dart';

import '../../../domain/entities/word.dart';
import '../../../domain/repositories/word_repository.dart';
import '../../models/word_model.dart';
import '../datasource/word_datasource.dart';

class WordRepository implements IWordRepository {
  IWordDatasource datasource;

  WordRepository(
    this.datasource,
  );

  @override
  Future<Either<Failure, Word>> getWord(String word) async {
    try {
      var result = await datasource.getWord(word);
      var wordResult = WordModel.fromMap(result);
      return Right(wordResult);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
