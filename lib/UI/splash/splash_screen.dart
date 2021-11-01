import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/UI/home/home_page.dart';
import 'dart:async';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage();

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late Timer _timer;
  double value = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progressBar();
    nextPage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  void nextPage() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  void progressBar() {
    _timer = Timer.periodic(Duration(milliseconds: 400), (Timer timer) {
      setState(() {
        if (value == 1) {
          timer.cancel();
        } else {
          value += 0.1;
        }
      });
    });
  }

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
                  value: value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
