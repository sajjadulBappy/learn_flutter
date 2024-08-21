import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FractionallySizedBox & OrientationBuilder")),
      body: OrientationBuilder(
        builder: (context, orientation) {
          // Determine the fraction of the size based on the orientation
          double widthFactor = orientation == Orientation.portrait ? 0.8 : 0.6;
          double heightFactor = orientation == Orientation.portrait ? 0.4 : 0.6;

          return Center(
            child: FractionallySizedBox(
              widthFactor: widthFactor,   // Fraction of the parent's width
              heightFactor: heightFactor, // Fraction of the parent's height
              child: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    orientation == Orientation.portrait
                        ? "Portrait Mode"
                        : "Landscape Mode",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}