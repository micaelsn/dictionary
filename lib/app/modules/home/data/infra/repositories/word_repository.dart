import 'package:dartz/dartz.dart';
import 'package:dictionary/shared/common/main.dart';
import 'package:dictionary/shared/helpers/main.dart';
import 'package:dictionary/shared/storage/main.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/repositories/word_repository.dart';
import '../datasource/word_datasource.dart';

class WordRepository implements IWordRepository {
  IWordDatasource datasource;

  WordRepository(
    this.datasource,
  );

  @override
  Future<Either<Failure, List<Word>>> getWord(String word) async {
    try {
      var result = await datasource.getWord(word);

      var storage = Modular.get<IStorageApp>();
      if (result.isNotEmpty) {
        storage.put('history', result[0].word!);
      }

      return Right(result);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
