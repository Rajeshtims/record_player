import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:record_player/screens/songs_list.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const SongsList()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[100],
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
      showUnselectedLabels: true,
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(size: 20.0, AssetImage("assets/images/List.png")),
          label: 'Songs',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(size: 22.0, AssetImage("assets/images/Player.png")),
          label: 'Playing Now',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(size: 25.0, AssetImage("assets/images/Playlist.png")),
          label: 'Playlists',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(size: 25.0, AssetImage("assets/images/Search.png")),
          label: 'Search',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}


