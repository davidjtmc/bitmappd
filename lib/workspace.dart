import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Workspace extends StatefulWidget {
  final int imageHeight;
  final int imageWidth;
  final int colourDepth;

  const Workspace({Key? key, required this.imageHeight, required this.imageWidth, required this.colourDepth}) : super(key: key);

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  List<List<int>> bitValues = [];

  @override
  void initState() {
    super.initState();
    bitValues = List.generate(widget.imageHeight, (_) => List.generate(widget.imageWidth, (_) => 0));
  }

  void updateBitValue(int x, int y, int value) {
    setState(() {
      bitValues[y][x] = value;
    });
  }

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
                              BitGrid(height: widget.imageHeight, width: widget.imageWidth, onBitChanged: updateBitValue),
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
                              bitValues: bitValues,
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

// ...

class VisualCell extends StatelessWidget {
  final Color color;

  const VisualCell({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: color,
    );
  }
}

class VisualGrid extends StatelessWidget {
  final int height;
  final int width;
  final List<List<int>> bitValues;

  const VisualGrid({Key? key, required this.height, required this.width, required this.bitValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
          children: List.generate(height, (y) {
            return Row(
              children: List.generate(width, (x) {
                return VisualCell(color: bitValues[y][x] == 1 ? Colors.black : Colors.white);
              }),
            );
          })),
    );
  }
}

class BitCell extends StatefulWidget {
  final Function(int value) onValueChanged;

  const BitCell({Key? key, required this.onValueChanged}) : super(key: key);

  @override
  State<BitCell> createState() => _BitCellState();
}

class _BitCellState extends State<BitCell> {
  TextEditingController _controller = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int value = int.tryParse(_controller.text) ?? 0;
      if (value == 0 || value == 1) {
        widget.onValueChanged(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class BitGrid extends StatefulWidget {
  final int height;
  final int width;
  final Function(int x, int y, int value) onBitChanged;

  const BitGrid({Key? key, required this.height, required this.width, required this.onBitChanged})
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
          children: List.generate(widget.height, (y) {
            return Row(
              children: List.generate(widget.width, (x) {
                return BitCell(
                  onValueChanged: (value) {
                    widget.onBitChanged(x, y, value);
                  },
                );
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

