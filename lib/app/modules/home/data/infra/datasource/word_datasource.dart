import 'package:dictionary/shared/common/main.dart';

abstract class IWordDatasource {
  Future<List<Word>> getWord(String word);
}
