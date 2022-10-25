import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary/shared/common/main.dart';
import 'package:flutter/material.dart';

class AudioPlayerComponent extends StatefulWidget {
  final Phonetic phonetic;
  AudioPlayerComponent({Key? key, required this.phonetic}) : super(key: key);

  @override
  State<AudioPlayerComponent> createState() => _AudioPlayerComponentState();
}

class _AudioPlayerComponentState extends State<AudioPlayerComponent> {
  final player = AudioPlayer();
  ValueNotifier isPlaying = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  init() async {
    if (widget.phonetic.audio?.isNotEmpty == true) {
      try {
        await player.setSourceUrl(widget.phonetic.audio!);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isPlaying,
      builder: (context, value, child) => Container(
        child: Row(
          children: [
            if (widget.phonetic.audio?.isNotEmpty == true)
              IconButton(
                  onPressed: () async {
                    if ((value as bool)) {
                      isPlaying.value = false;
                      player.pause();
                    } else {
                      isPlaying.value = true;
                      player.resume();
                    }
                  },
                  icon: (value as bool)
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow)),
            const SizedBox(width: 15),
            Text(widget.phonetic.text ?? '')
          ],
        ),
      ),
    );
  }
}
