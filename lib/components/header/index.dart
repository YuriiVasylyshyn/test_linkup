import 'package:flutter/material.dart';
import 'package:test_linkup/constants/listsToUse/index.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: icons
            .map<Widget>(
              (item) => Image(
                image: AssetImage(item),
                width: 40,
                height: 40,
              ),
            )
            .toList());
  }
}
