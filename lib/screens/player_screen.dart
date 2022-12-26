import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:record_player/widgets/airplay_and_queue_bar.dart';
import 'package:record_player/widgets/bottom_nav_bar.dart';
import 'package:record_player/widgets/player_bar.dart';
import 'package:record_player/widgets/volume_bar.dart';

class PlayerScreen extends StatefulWidget {
  final String title;
  const PlayerScreen({super.key, required this.title});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width - 64,
                    width: MediaQuery.of(context).size.width - 64,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          invertColors: true,
                          image: AssetImage('assets/images/vinyl.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.playlist_add),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.alarm),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_outline),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert_rounded),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Title of the song - Ellipsis",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        // const SizedBox(
                        //   height: 4.0,
                        // ),
                        Row(
                          children: const [
                            Text(
                              "Artist",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  PlayerBar(),
                  // const SizedBox(height: 10.0,),
                  const VolumeBar(),
                  const SizedBox(height: 10.0,),
                  const AirplayAndQueue()
                ],
              ),

              // const LinearProgressIndicator(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar());
  }
}
