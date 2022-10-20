import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dictionary/app/modules/home/domain/repositories/word_repository.dart';
import 'package:dictionary/app/modules/home/domain/usecases/word_usecase.dart';
import 'package:dictionary/shared/common/main.dart';

class WordRepositoryMock extends Mock implements IWordRepository {}

void main() {
  final repository = WordRepositoryMock();
  final usecase = WordUseCase(repository);
  test('Should return a list of Word', () async {
    when(() => repository.getWord('hello'))
        .thenAnswer((invocation) async => Right([WordModel()]));

    final result = await usecase(word: 'hello');

    expect(result.fold(id, id), isA<List<Word>>());
  });
}
