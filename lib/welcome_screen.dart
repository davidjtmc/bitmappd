import 'package:bitmappd/workspace.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  TextEditingController _colourDepthController = TextEditingController();

  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Bitmapp'd",
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 20),
            Container(
              width: 400,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _heightController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Image Height (px)")),
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                    controller: _widthController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Image Width (px)")),
                  ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                width: 195,
                child: TextField(
                  controller: _colourDepthController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Colour Depth (bits)')),
                )),
            SizedBox(height: 20),
            SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Workspace(
                                    imageHeight: int.parse(
                                        _heightController.text.trim()),
                                    imageWidth:
                                        int.parse(_widthController.text.trim()),
                                    colourDepth: int.parse(
                                        _colourDepthController.text.trim()),
                                  )));
                    },
                    child: Center(
                      child: Text(
                        "Start",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
