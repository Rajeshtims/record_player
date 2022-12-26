import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      keyboardType: TextInputType.text,
      placeholder: 'Search  Library',
      placeholderStyle: const TextStyle(
        color: Color(0xffC4C6CC),
        fontSize: 14.0,
        fontFamily: 'Brutal',
      ),
      prefix: Padding(
        padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
        child: Icon(
          Icons.search,
          color: Color(0xffC4C6CC),
        ),
      ),
    );

  }
}
