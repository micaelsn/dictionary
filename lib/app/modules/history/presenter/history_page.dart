import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:dictionary/shared/helpers/main.dart';

import '../stores/history_store.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final store = Modular.get<HistoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          IconButton(onPressed: store.removeHistory, icon: Icon(Icons.delete))
        ],
      ),
      body: ScopedBuilder<HistoryStore, Failure, List<String>>(
        store: store,
        onState: (_, state) {
          if (state.isNotEmpty) {
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
                  var word = state[index];

                  return wordCard(word);
                });
          }

          return const Center(
            child: Text('No itens saved.'),
          );
        },
        onError: (context, error) => const Center(
          child: Text(
            'Words do not found.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget wordCard(String word) {
    return Card(
        child: InkWell(
            onTap: () => Modular.to.pushNamed('/word-details/${word}'),
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                word,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            )));
  }
}
