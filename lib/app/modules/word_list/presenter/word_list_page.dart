import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../stores/word_list_store.dart';

class WordListPage extends StatefulWidget {
  final String title;
  const WordListPage({Key? key, this.title = "WordList"}) : super(key: key);

  @override
  _WordListPageState createState() => _WordListPageState();
}

class _WordListPageState extends ModularState<WordListPage, WordListStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: ScopedBuilder<WordListStore, Exception, int>(
        store: store,
        onState: (_, counter) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Text('$counter'),
          );
        },
        onError: (context, error) => Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
