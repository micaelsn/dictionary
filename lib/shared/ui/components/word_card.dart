import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WordCard extends StatelessWidget {
  final String word;
  const WordCard({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: () => Modular.to.pushNamed('/word-details/$word'),
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                word,
                style: Theme.of(context).textTheme.headline2,
              ),
            )));
  }
}
