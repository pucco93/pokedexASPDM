import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double currentPageIndex = 0.0;
  final int _dotsCount = 4;

  void _incrementCounter() {
    if (currentPageIndex < 3) {
      setState(() {
        currentPageIndex++;
      });
    }
  }

  void _decrementCounter() {
    if (currentPageIndex > 0) {
      setState(() {
        currentPageIndex--;
      });
    }
  }

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
      primary: Colors.redAccent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(18.0)),
      ));

  String _isNext() {
    if (currentPageIndex == 3) {
      return "Start";
    } else {
      return "Next";
    }
  }

  void updateDirection(PageController pageController) {
    if (currentPageIndex > pageController.page!.round()) {
      _decrementCounter();
    } else {
      _incrementCounter();
    }
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(
      initialPage: 0,
    );
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: PageView(
              controller: _pageController,
              onPageChanged: (int page) => updateDirection(_pageController),
              children: <Widget>[
            FirstPage(),
            SecondPage(),
            ThirdPage(),
            LastPage()
          ])),
      const Padding(padding: EdgeInsets.only(top: 50)),
      DotsIndicator(
        dotsCount: _dotsCount,
        position: currentPageIndex,
        decorator: const DotsDecorator(
          color: Colors.black,
          activeColor: Colors.redAccent,
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 30)),
      ElevatedButton(
          style: style, onPressed: _incrementCounter, child: Text(_isNext())),
      const Padding(padding: EdgeInsets.only(bottom: 30)),
    ]));
  }
}

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
          Padding(padding: EdgeInsets.only(top: 30)),
          Image(image: AssetImage("assets/images/poke_ball_icon.png")),
          Padding(padding: EdgeInsets.only(top: 30)),
          Text("A pokedex in your pocket",
              style: TextStyle(
                  // GoogleFonts.montserrat(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ]));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [

            ]));
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFF0000FF));
  }
}

class LastPage extends StatelessWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFF000000));
  }
}
