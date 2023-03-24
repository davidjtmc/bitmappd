import 'package:bitmappd/workspace.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Bitmapp'd", style: TextStyle(fontSize: 50),),
            SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: () {   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Workspace())); },
                child: Center(child: Text("Start", style: TextStyle(color: Colors.white, fontSize: 20),), )
              )
            )
          ],
        ),
      ),
    );
  }
}

