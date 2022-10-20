import 'package:dictionary/shared/helpers/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();
    store.onChangePage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: ScopedBuilder<HomeStore, Failure, int>(
        store: store,
        onState: (_, counter) {
          return BottomNavigationBar(
              currentIndex: store.state,
              onTap: store.onChangePage,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: "Word List",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: "History",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favorites",
                ),
              ]);
        },
      ),
    );
  }
}
