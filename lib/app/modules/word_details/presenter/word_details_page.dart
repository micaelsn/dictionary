import 'package:dictionary/shared/common/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../stores/word_details_store.dart';

class WordDetailsPage extends StatefulWidget {
  final String word;
  const WordDetailsPage({Key? key, required this.word}) : super(key: key);

  @override
  _WordDetailsPageState createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  final store = Modular.get<WordDetailsStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word),
      ),
      body: ScopedBuilder<WordDetailsStore, Exception, List<Word>>(
        store: store,
        onState: (_, counter) {
          return Container();
        },
        onError: (context, error) => Center(
          child: Text(
            'Words do not found.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
