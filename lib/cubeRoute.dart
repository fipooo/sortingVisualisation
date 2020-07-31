import 'dart:math';

import 'package:flutter/material.dart';

class CubeRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  CubeRoute(this.exitPage, this.enterPage)
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => enterPage,
    transitionsBuilder: _transitionsBuilder(exitPage, enterPage),
  );

  static _transitionsBuilder(exitPage, enterPage) =>
          (context, animation, secondaryAnimation, child) {
        return Stack(
          children: <Widget>[
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: Offset(-1.0, 0.0),
              ).animate(animation),
              child: Container(
                color: Colors.white,
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..rotateY(pi / 2 * animation.value),
                  alignment: FractionalOffset.centerRight,
                  child: exitPage,
                ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: Container(
                color: Colors.white,
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..rotateY(pi / 2 * (animation.value - 1)),
                  alignment: FractionalOffset.centerLeft,
                  child: enterPage,
                ),
              ),
            )
          ],
        );
      };
}
