import 'package:dictionary/app/modules/home/domain/entities/word.dart';

abstract class IWordDatasource {
  Future<List<Word>> getWord(String word);
}
