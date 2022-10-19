import 'package:dictionary/app/modules/home/domain/entities/word.dart';
import 'package:dictionary/app/modules/home/domain/repositories/word_repository.dart';
import 'package:dictionary/app/modules/home/domain/usecases/word_usecase.dart';
import 'package:dictionary/app/modules/home/infra/models/word_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class WordRepositoryMock extends Mock implements IWordRepository {}

void main() {
  final repository = WordRepositoryMock();
  final usecase = WordUseCase(repository);
  test('Should return a object of type Word', () async {
    when(() => repository.getWord('hello'))
        .thenAnswer((invocation) async => Right(WordModel()));

    final result = await usecase(word: 'hello');

    expect(result.fold(id, id), isA<Word>());
  });
}
