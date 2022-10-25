import 'package:dictionary/shared/common/main.dart';
import 'package:flutter/material.dart';

import 'audio_player_component.dart';

class WordComponent extends StatefulWidget {
  final Word word;
  const WordComponent({Key? key, required this.word}) : super(key: key);

  @override
  State<WordComponent> createState() => _WordComponentState();
}

class _WordComponentState extends State<WordComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.pink[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.word.word ?? ''),
                  const SizedBox(height: 15),
                  Text(widget.word.phonetic ?? '')
                ],
              ),
            ),
            const SizedBox(height: 15),
            ...audioPlayer(widget.word.phonetics),
            const SizedBox(height: 15),
            Text(
              "Meanings",
              style: Theme.of(context).textTheme.headline2,
            ),
            ...meaning(widget.word.meanings),
          ],
        ),
      ),
    );
  }

  meaning(List<Meaning?>? meanings) {
    return meanings?.map((e) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(e?.partOfSpeech ?? ''),
            ...definition(e?.definitions ?? [])
          ],
        ));
  }

  definition(List<Definition?>? definitions) {
    return definitions?.map((e) => Text(
          '- ${e?.definition ?? ''}',
          textAlign: TextAlign.start,
        ));
  }

  audioPlayer(List<Phonetic?>? phonetics) {
    return phonetics?.map((e) => AudioPlayerComponent(phonetic: e!));
  }
}
