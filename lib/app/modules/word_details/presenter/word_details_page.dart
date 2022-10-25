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
    init();
    super.initState();
  }

  init() async {
    await store.getWords(widget.word);
    store.validateFavoriteWord(widget.word);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word),
        actions: [
          ValueListenableBuilder(
            valueListenable: store.isFavorited,
            builder: (context, value, child) => IconButton(
                onPressed: () => store.addToFavorites(),
                icon: (value as bool)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline)),
          )
        ],
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
