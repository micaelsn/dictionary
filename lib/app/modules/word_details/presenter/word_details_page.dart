import 'package:dictionary/shared/common/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../stores/word_details_store.dart';
import 'components/word_component.dart';

class WordDetailsPage extends StatefulWidget {
  final String word;
  const WordDetailsPage({Key? key, required this.word}) : super(key: key);

  @override
  _WordDetailsPageState createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  final store = Modular.get<WordDetailsStore>();

  @override
  void initState() {
    store.getWords(widget.word);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word),
      ),
      body: ScopedBuilder<WordDetailsStore, Exception, List<Word>>(
        store: store,
        onState: (_, state) {
          return PageView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) => WordComponent(word: state[index]),
          );
        },
        onLoading: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (context, error) => const Center(
          child: Text(
            'Words do not found.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
