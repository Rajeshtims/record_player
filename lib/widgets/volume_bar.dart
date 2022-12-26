import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VolumeBar extends StatefulWidget {
  const VolumeBar({super.key});

  @override
  State<VolumeBar> createState() => _VolumeBarState();
}

class _VolumeBarState extends State<VolumeBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ImageIcon(
            AssetImage('assets/images/Volume_down.png'),
          ),
          SizedBox(
            width: 280.0,
            child: Slider(
              value: 3,
              onChanged: (value) {},
              min: 0,
              max: 10,
            ),
          ),
          const ImageIcon(
            AssetImage('assets/images/Volume_up.png'),
          )
        ],
      ),
    );
  }
}
