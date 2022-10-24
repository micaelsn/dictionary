import 'definitions.dart';

abstract class Meaning {
  String? partOfSpeech;
  List<Definition> definitions;

  Meaning({
    this.partOfSpeech,
    required this.definitions,
  });
}
