// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SearchBarN extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;

  SearchBarN({Key? key,     
  required this.text,
    required this.onChanged,
    }) : super(key: key);

  @override
  _SearchBarNState createState() => _SearchBarNState();
}

class _SearchBarNState extends State<SearchBarN> {
  final controller = TextEditingController();
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? 32 : 245,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: kElevationToShadow[6],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: !_folded
                  ? TextField(
                    controller: controller,
                    style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 15),
                          hintText: "Procura por tema ou por data",
                          hintStyle: TextStyle(color: Colors.orange[300], fontSize: 14),
                          border: InputBorder.none),
                    onChanged: widget.onChanged,
                    )
                  : null,
            ),
          ),
          Container(
              child: Material(
            type: MaterialType.transparency,
            child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: !_folded ? GestureDetector(
                  child: Icon(Icons.close, size: 18, color: Colors.orange),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                    _folded = !_folded;
                  },
                ) : Icon(Icons.search, size: 18, color: Colors.orange),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                }),
          )),
        ],
      ),
    );
  }
}
