import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dictionary/shared/common/main.dart';
import 'package:dictionary/shared/helpers/errors.dart';
import 'package:flutter_triple/flutter_triple.dart';

class WordListStore extends NotifierStore<Failure, List<Word>> {
  final queryPost = FirebaseFirestore.instance
      .collection('words')
      .withConverter<Word>(
          fromFirestore: (snapshot, _) => WordModel.fromMap(snapshot.data()!),
          toFirestore: (user, _) => (user as WordModel).toMap());

  WordListStore() : super([]);
}
