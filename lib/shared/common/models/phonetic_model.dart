import 'dart:convert';

import '../entities/phonetic.dart';

class PhoneticModel extends Phonetic {
  PhoneticModel({
    super.text,
    super.audio,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'audio': audio,
    };
  }

  factory PhoneticModel.fromMap(Map<String, dynamic> map) {
    return PhoneticModel(
      text: map['text'],
      audio: map['audio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneticModel.fromJson(String source) =>
      PhoneticModel.fromMap(json.decode(source));
}
