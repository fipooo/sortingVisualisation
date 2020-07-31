import 'package:flutter/material.dart';
import 'package:sort/cubeRoute.dart';
import 'package:sort/screens/bubbleSortScreen.dart';
import 'package:sort/main.dart';
import 'package:sort/screens/quickSortScreen.dart';

import 'screens/inserionSortScreen.dart';

const String homeRoute = '/';
const String bubbleSort = '/bubble';
const String insertionSort = '/insertion';
const String quickSort = '/quick';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return CubeRoute(MyHomePage(),  MyHomePage());
      case bubbleSort:
        return MaterialPageRoute(builder: (_) => BubbleSortScreen());
      case insertionSort:
        return MaterialPageRoute(builder: (_) => InsertionSortScreen());
      case quickSort:
        return MaterialPageRoute(builder: (_) => QuickSortScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}