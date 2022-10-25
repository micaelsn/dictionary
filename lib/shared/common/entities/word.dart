import 'meaning.dart';
import 'phonetic.dart';

abstract class Word {
  String? word;
  String? phonetic;
  String? origin;
  List<Meaning?>? meanings;
  List<Phonetic?>? phonetics;

  Word({
    this.word,
    this.phonetic,
    this.origin,
    this.meanings,
    this.phonetics,
  });
}
