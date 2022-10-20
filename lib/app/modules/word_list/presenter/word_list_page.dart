import 'package:dictionary/shared/common/main.dart';
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

class _WordListPageState extends State<WordListPage> {
  final store = Modular.get<WordListStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word List'),
      ),
      body: ScopedBuilder<WordListStore, Exception, List<Word>>(
        store: store,
        onState: (_, counter) {
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: store.state.length,
              itemBuilder: (BuildContext ctx, index) {
                var word = store.state[index];

                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    word.word ?? '',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                );
              });
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
