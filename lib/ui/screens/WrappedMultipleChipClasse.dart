// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

class WrappedMultipleChipClasse extends StatefulWidget {
  @override
  _WrappedMultipleChipClasseState createState() => _WrappedMultipleChipClasseState();
}

class _WrappedMultipleChipClasseState extends State<WrappedMultipleChipClasse> {
  List<String> tags = [];
  List<String> options = [
    'Saurischia',
    'Hexactinellida',
    'Rhynchonellata',
    'Ornithischia',
    'Gastropoda',
    'Sauropsida'
    'Bivalvia'
  ];

  @override
  Widget build(BuildContext context) {
    return ChipsChoice.multiple(
      value: tags,
      onChanged: ((List<String> val) => setState(() => tags = val)),
      choiceItems: C2Choice.listFrom<String, String>(
        source: options,
        value: (i, v) => v,
        label: (i, v) => v,
      ),
      wrapped: true,
      choiceStyle: C2ChoiceStyle(
        color: Colors.orange[300],
        brightness: Brightness.dark,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      choiceActiveStyle: C2ChoiceStyle(
        color: Colors.blue,
      ),
    );
  }
}
