import 'dart:html';

import 'package:flutter/material.dart';

class Workspace extends StatefulWidget {
  final int imageHeight;
  final int imageWidth;
  final int colourDepth;

  const Workspace({Key? key, required this.imageHeight, required this.imageWidth, required this.colourDepth}) : super(key: key);

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: Center(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                          boxShadow: panelShadow,
                            borderRadius: BorderRadius.circular(30)),

                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text('Input (Bits)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(
                                height: 20,
                              ),
                              BitGrid(height: widget.imageHeight, width: widget.imageWidth),
                            ],
                          ),
                        )),
                    SizedBox(child: Icon(Icons.arrow_right_alt, color: Colors.white,size: 50,),width: 100),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                        boxShadow: panelShadow,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('Output (Image)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 20,
                            ),
                            VisualGrid(
                              height: widget.imageHeight,
                              width: widget.imageWidth,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
      height: 50,
      width: 50,
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
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
          children: List.generate(widget.height, (index) {
        return Row(
          children: List.generate(widget.width, (index) {
            return VisualCell();
          }),
        );
      })),
    );
  }
}

class BitCell extends StatefulWidget {
  const BitCell({Key? key}) : super(key: key);

  @override
  State<BitCell> createState() => _BitCellState();
}

class _BitCellState extends State<BitCell> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  }
}

class BitGrid extends StatefulWidget {
  final int height;
  final int width;

  const BitGrid({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<BitGrid> createState() => _BitGridState();
}

class _BitGridState extends State<BitGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
          children: List.generate(widget.height, (index) {
        return Row(
          children: List.generate(widget.width, (index) {
            return BitCell();
          }),
        );
      })),
    );
  }
}

final List<BoxShadow> panelShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.2),
    blurRadius: 10,
    offset: const Offset(0, 3),
  ),
];
