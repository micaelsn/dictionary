import 'package:dartz/dartz.dart';
import 'package:dictionary/shared/helpers/main.dart';

import '../entities/word.dart';

abstract class IWordRepository {
  Future<Either<Failure, List<Word>>> getWord(String word);
}
