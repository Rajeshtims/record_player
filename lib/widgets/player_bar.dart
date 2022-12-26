import 'dart:core';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlayerBar extends StatefulWidget {
  const PlayerBar({super.key});
  
  @override
  State<PlayerBar> createState() => _PlayerBarState();
}

class _PlayerBarState extends State<PlayerBar> {
  final player = AudioPlayer();
  PlayerState isPlaying = PlayerState.paused;
  Duration duration = const Duration(seconds: 0);
  Duration position = const Duration(seconds: 0);

  @override
  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen(
      (PlayerState s) => {
        // print('Current player state: $s');
        setState(() => isPlaying = s)
      },
    );

    player.onDurationChanged.listen(
      (Duration d) {
        // print('Max duration: $d');
        setState(() => duration = d);
      },
    );

    player.onPositionChanged.listen(
      (Duration p) => {
        // print('Current position: $p');
        setState(() => position = p)
      },
    );

    player.onPlayerComplete.listen((event) {
      // onComplete();
      setState(
        () {
          position = duration;
        },
      );
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.0,
      // decoration: BoxDecoration(
      //     color: Colors.grey, borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(children: [
          SizedBox(
            height: 10.0,
            child: Slider(
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await player.seek(position);
              },
              min: 0,
              max: duration.inSeconds.toDouble(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
            // padding: EdgeInsets.symmetric( horizontal: 24.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(position),
                ),
                Text("-" + formatTime(duration - position))
              ],
            ),
          ),
          SizedBox(
            height: 45.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_previous_rounded,
                      size: 45.0,
                    )),
                IconButton(
                    onPressed: () async {
                      if (isPlaying == PlayerState.playing) {
                        player.pause();
                      } else {
                        await player.play(
                          AssetSource('/audios/david.mp3'),
                          volume: 4.0,
                        );
                      }
                    },
                    icon: ((isPlaying == PlayerState.paused)
                        ? const Icon(
                            Icons.play_circle_rounded,
                            size: 45.0,
                          )
                        : const Icon(
                            Icons.pause_circle_rounded,
                            size: 45.0,
                          ))),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_next_rounded,
                      size: 45.0,
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }
}
