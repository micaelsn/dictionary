//

import 'package:dictionary/shared/api/main.dart';
import 'package:dictionary/shared/helpers/main.dart';
import 'package:dio/dio.dart';

import '../data/datasource/word_datasource.dart';

class WordDatasource implements IWordDatasource {
  final ClientAPI client;

  WordDatasource(this.client);

  @override
  Future<Map<String, dynamic>> getWord(String word) async {
    var res;
    try {
      final response = await client.get("/api/v2/entries/en/${word}");

      if (response.statusCode == 200) {
        res = response.data;
      }
    } on DioError catch (_) {
      throw DatasourceError(message: "Falha");
    }
    return res;
  }
}
