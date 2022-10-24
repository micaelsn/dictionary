import 'dart:convert';

import 'package:dictionary/shared/common/models/definition_model.dart';

import '../entities/definitions.dart';
import '../entities/meaning.dart';

class MeaningModel extends Meaning {
  MeaningModel({
    super.partOfSpeech,
    required super.definitions,
  });

  Map<String, dynamic> toMap() {
    return {
      'partOfSpeech': partOfSpeech,
      'definitions':
          definitions.map((x) => (x as DefinitionModel).toMap()).toList(),
    };
  }

  factory MeaningModel.fromMap(Map<String, dynamic> map) {
    return MeaningModel(
      partOfSpeech: map['partOfSpeech'],
      definitions: List<Definition>.from(
          map['definitions']?.map((x) => DefinitionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MeaningModel.fromJson(String source) =>
      MeaningModel.fromMap(json.decode(source));
}
