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

class _FavoritesPageState extends ModularState<FavoritesPage, FavoritesStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: ScopedBuilder<FavoritesStore, Exception, int>(
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
