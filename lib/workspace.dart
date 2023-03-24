import 'dart:html';

import 'package:flutter/material.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key}) : super(key: key);

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VisualGrid(height: 10, width: 10,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class VisualCell extends StatefulWidget {
  const VisualCell({Key? key}) : super(key: key);

  @override
  State<VisualCell> createState() => _VisualCellState();
}

class _VisualCellState extends State<VisualCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(border: Border.all(color: Colors.black,)),
    );
  }
}

class VisualGrid extends StatefulWidget {
  final int height;
  final int width;

  const VisualGrid({super.key, required this.height, required this.width});

  @override
  State<VisualGrid> createState() => _VisualGridState();
}

class _VisualGridState extends State<VisualGrid> {
  @override
  Widget build(BuildContext context) {
    return Column( children: List.generate(widget.height, (index) {
      return Row(children: List.generate(widget.width, (index) {
        return VisualCell();
      }),);
    })

    );
  }
}



