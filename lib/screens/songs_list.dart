import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:record_player/widgets/bottom_nav_bar.dart';
import 'package:record_player/widgets/search_bar.dart';

class SongsList extends StatelessWidget {
  const SongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // toolbarHeight: 32.0,
            pinned: true, // set this to true if you don't the app bar to collapse completely while scrolling upwards
            // expandedHeight: 100.0,
            forceElevated: true,
            floating: true,
            leading: IconButton(
              icon: const Icon(
                Icons.navigate_before,
                size: 34.0,
              ),
              onPressed: () {},
            ),
            bottom: SearchBar(),
            flexibleSpace: const FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Songs",
                ),
              ),
              
              centerTitle: true,
            ),
            // ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.sort))
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 100.0,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.greenAccent,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0)),
              );
            }, childCount: 15),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
