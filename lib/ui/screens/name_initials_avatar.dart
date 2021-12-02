import 'dart:math';

import 'package:flutter/material.dart';

const List<Color> _avatarColors = [
  const Color(0xffE1AE23),
  const Color(0xffD96B1C),
  const Color(0xffFF7257),
  const Color(0xffEB4829),
  const Color(0xffE679FA),
  const Color(0xffA02CB5),
  const Color(0xff4194B4),
  const Color(0xff0589Fc),
  const Color(0xff95DE49),
  const Color(0xff548E16),
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
