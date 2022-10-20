import 'dart:convert';

import '../entities/main.dart';

class WordModel extends Word {
  String? origin;
  String? phonetic;
  String? word;

  WordModel({super.word, super.phonetic, super.origin});

  Map<String, dynamic> toMap() {
    return {
      'origin': origin,
      'phonetic': phonetic,
      'word': word,
    };
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      origin: map['origin'],
      phonetic: map['phonetic'],
      word: map['word'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source));
}
