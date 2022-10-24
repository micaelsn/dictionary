import 'meaning.dart';

abstract class Word {
  String? word;
  String? phonetic;
  String? origin;
  List<Meaning?>? meanings;

  Word({
    required this.word,
    required this.phonetic,
    required this.origin,
    required this.meanings,
  });
}
