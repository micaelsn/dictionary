import 'package:dictionary/shared/common/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterfire_ui/firestore.dart';
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
        body: FirestoreQueryBuilder<Word>(
            query: store.queryPost,
            pageSize: 5,
            builder: (context, snapshot, _) {
              if (snapshot.isFetching) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Something went wrong! ${snapshot.error}');
              } else {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: snapshot.docs.length,
                    itemBuilder: (context, index) {
                      final hasEndReached = snapshot.hasMore &&
                          index + 1 == snapshot.docs.length &&
                          !snapshot.isFetchingMore;

                      if (hasEndReached) {
                        snapshot.fetchMore();
                      }

                      final word = snapshot.docs[index].data();
                      return wordCard(word);
                    });
              }
            }));
  }

  Widget wordCard(Word word) {
    return Card(
        child: InkWell(
            onTap: () => Modular.to.pushNamed('/word-details/${word.word}'),
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                word.word ?? '',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            )));
  }
}
