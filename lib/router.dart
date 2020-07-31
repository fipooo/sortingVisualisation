import 'package:flutter/material.dart';
import 'package:sort/cubeRoute.dart';
import 'package:sort/main.dart';
import 'package:sort/screens/visualizationScreen.dart';

const String homeRoute = '/';
const String bubbleSort = '/bubble';
const String insertionSort = '/insertion';
const String quickSort = '/quick';
const String selectionSort = '/selection';
const String visualization = '/visualization';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return CubeRoute(MyHomePage(), MyHomePage());
      case visualization:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => VisualizationScreen(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}