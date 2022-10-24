import 'dart:convert';

import '../entities/main.dart';
import '../entities/meaning.dart';
import 'meaning_model.dart';

class WordModel extends Word {
  WordModel({super.word, super.phonetic, super.origin, super.meanings});

  Map<String, dynamic> toMap() {
    return {
      'meanings': meanings?.map((x) => (x as MeaningModel).toMap()).toList(),
      'origin': origin,
      'phonetic': phonetic,
      'word': word,
    };
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      meanings: map['meanings'] != null
          ? List<Meaning?>.from(
              map['meanings']?.map((x) => MeaningModel.fromMap(x)))
          : null,
      origin: map['origin'],
      phonetic: map['phonetic'],
      word: map['word'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source));
}
