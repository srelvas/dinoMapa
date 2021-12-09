// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, unnecessary_const
import 'dart:math';

import 'package:flutter/material.dart';

const List<Color> _avatarColors = [
  const Color(0xffFA8E8E),
  const Color(0xffa20909),
  const Color(0xffFF8800),
  const Color(0xffEB4829),
  const Color(0xff14A1B9),
  const Color(0xff6032AF),
  const Color(0xff0589Fc),
];

class NameInitialsAvatar extends StatelessWidget {
  const NameInitialsAvatar(
    this.name, {
    Key? key,
    this.size = 70.0,
  }) : super(key: key);

  static final Color _color = _avatarColors[Random().nextInt(_avatarColors.length)];

  final String? name;
  final double size;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        color: _color,
        child: name != null
            ? Text(
                nameWithInitials(name!),
                style: Theme.of(context).textTheme.headline3!,
              )
            : const Icon(
                Icons.person,
                color: Colors.white,
                size: 40.0,
              ),
      ),
    );
  }

  static String nameWithInitials(String fullName, [int maxNameLenght = 5]) {
    final List<String> names = fullName.split(' ');
    names.removeWhere((element) => element.trim().isEmpty);

    if (names.length > 1) {
      for (int i = 0; i < names.length; i++) {
        names[i] = names[i][0] + '';
      }
    }
    return names.first + names.last;
  }
}
