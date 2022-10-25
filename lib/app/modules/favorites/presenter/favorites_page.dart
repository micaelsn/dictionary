import 'package:dictionary/shared/common/main.dart';
import 'package:dictionary/shared/helpers/main.dart';
import 'package:dictionary/shared/ui/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../stores/favorites_store.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage({Key? key, this.title = "Favorites"}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final store = Modular.get<FavoritesStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ScopedBuilder<FavoritesStore, Failure, List<String>>(
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

                  return WordCard(word: word);
                });
          }

          return const Center(
            child: Text('No itens saved.'),
          );
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
