import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/splash.jpg",
                width: 144,
                height: 168,
              ),
              Container(
                width: width * 0.7,
                height: 15,
                margin: EdgeInsets.all(20),
                child: LinearProgressIndicator(
                  backgroundColor: Color(0xFFcbaf97),
                  color: Color(0xFF31637c),
                  minHeight: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
