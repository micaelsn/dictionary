import 'dart:convert';

import '../entities/definitions.dart';

class DefinitionModel extends Definition {
  DefinitionModel({
    required super.definition,
  });

  Map<String, dynamic> toMap() {
    return {
      'definition': definition,
    };
  }

  factory DefinitionModel.fromMap(Map<String, dynamic> map) {
    return DefinitionModel(
      definition: map['definition'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DefinitionModel.fromJson(String source) =>
      DefinitionModel.fromMap(json.decode(source));
}
