import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController animationBackgroundController;
  late Animation<double>   fadeInBubbles;
  late Animation<double>   fadeOutBubbles;
  late Animation<double>   moveUpBubbles;
  late Animation<double>   rotateBubbles;
  late Animation<double>   bubblesOpacityIn;
  late Animation<double>   bubblesOpacityOut;
  late Animation<double>   bubbleReduceSpread;
  late Animation<double>   bubbleIncreaseSpread;

  @override
  void initState() {
    animationBackgroundController = AnimationController(vsync: this, duration: const Duration(milliseconds: 60000));
    fadeInBubbles = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationBackgroundController, curve: const Interval(0.0, 0.10))
    );
    fadeOutBubbles = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationBackgroundController, curve: const Interval(0.90, 1.0))
    );
    moveUpBubbles = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: animationBackgroundController, curve: const Interval(0.0, 1.0))
    );
    rotateBubbles = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: animationBackgroundController, curve: const Interval(0.0, 1.0))
    );
    bubblesOpacityIn = Tween(begin: 0.1, end: 0.3).animate(
      CurvedAnimation(parent: animationBackgroundController, curve: const Interval(0.15, 0.25, curve: Curves.bounceInOut),)
    );
    bubblesOpacityOut = Tween(begin: 0.1, end: 0.2).animate(
      CurvedAnimation(parent: animationBackgroundController, curve: const Interval(0.25, 0.30, curve: Curves.bounceInOut),)
    );
    animationBackgroundController.addListener(() {
      if (animationBackgroundController.status == AnimationStatus.completed) {
        animationBackgroundController.repeat();
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    animationBackgroundController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    animationBackgroundController.forward();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: const Icon(Icons.menu), 
              color: Theme.of(context).iconTheme.color,
              iconSize: Theme.of(context).iconTheme.size!,
              onPressed: (){}
              ),
          )
        ]
      ),
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: animationBackgroundController,
            builder: (BuildContext context, child){
              return Transform.rotate(
                angle: rotateBubbles.value,
                child: Opacity(
                  opacity: fadeInBubbles.value - fadeOutBubbles.value,
                  child: _Bubbles(bubblesOpacity: bubblesOpacityIn.value - bubblesOpacityOut.value),
                ),
              );
            }
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 12.5, sigmaY: 12.5
            ),
            child: Container(
              height: double.infinity,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 315.0,
              height: 350.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(70)),
                boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColor.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 2)),
                    ],
              ),
            ),
          )
        ],
      )
    );
  }
}

class _Bubbles extends StatelessWidget {
  final double bubblesOpacity;
  const _Bubbles({
    Key? key,
    required this.bubblesOpacity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
        bottom: 00.0,
        right: 00.0,
        child: Container(
          height: 20.0,
          width:  100.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(bubblesOpacity),
                  spreadRadius: 30,
                  blurRadius: 15,
                  offset: const Offset(0, 2)),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 220.0,
        right: 00.0,
        child: Container(
          height: 50.0,
          width:  100.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(bubblesOpacity),
                  spreadRadius: 30,
                  blurRadius: 15,
                  offset: const Offset(0, 2)),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 50.0,
        right: 70.0,
        child: Container(
          height: 120.0,
          width:  100.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(bubblesOpacity),
                  spreadRadius: 30,
                  blurRadius: 15,
                  offset: const Offset(0, 2)),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 50.0,
        right: 270.0,
        child: Container(
          height: 150.0,
          width:  100.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(bubblesOpacity),
                  spreadRadius: 30,
                  blurRadius: 15,
                  offset: const Offset(0, 2)),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 380.0,
        right: 30.0,
        child: Container(
          height: 30.0,
          width:  100.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(bubblesOpacity),
                  spreadRadius: 30,
                  blurRadius: 15,
                  offset: const Offset(0, 2)),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 300.0,
        right: 230.0,
        child: Container(
          height: 80.0,
          width:  100.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(bubblesOpacity),
                  spreadRadius: 30,
                  blurRadius: 15,
                  offset: const Offset(0, 2)),
            ],
          ),
        ),
      ),
      Positioned(
        top: 50.0,
        left: 70.0,
        child: Container(
          height: 100.0,
          width:  100.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(bubblesOpacity),
                  spreadRadius: 30,
                  blurRadius: 15,
                  offset: const Offset(0, 2)),
            ],
          ),
        ),
      ),
    ]
  );
  }
}