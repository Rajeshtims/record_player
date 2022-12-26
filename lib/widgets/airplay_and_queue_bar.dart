import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AirplayAndQueue extends StatelessWidget {
  const AirplayAndQueue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.cast),
          ImageIcon(AssetImage("assets/images/Queue.png"))
        ],
      ),
    );
  }
}
