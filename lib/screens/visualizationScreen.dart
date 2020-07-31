import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sort/functions/randomNumbers.dart';
import 'package:sort/provider/provider.dart';

const String bubble = 'bubble';
const String insertion = 'insertion';
const String quick = 'quick';
const String selection = 'selection';

class VisualizationScreen extends StatefulWidget {
  final String sortType;

  VisualizationScreen(this.sortType);

  @override
  _VisualizationScreen createState() => _VisualizationScreen();
}

class _VisualizationScreen extends State<VisualizationScreen> {
  List<int> numberList = new List();
  int compareNumber1 = 0;
  int compareNumber2;
  Timer timer;
  bool swap = false;
  RandomNumbers _randomNumbers = new RandomNumbers();

  bubbleSort() async {
    compareNumber2 = 1;
    setState(() {
      swap = false;
    });
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) async {
      if (compareNumber2 + 1 <= numberList.length) {
        if (numberList[compareNumber1] > numberList[compareNumber2]) {
          int tmp = numberList[compareNumber2];
          setState(() {
            numberList[compareNumber2] = numberList[compareNumber1];
            numberList[compareNumber1] = tmp;
            swap = true;
          });
          setState(() {
            compareNumber1 = compareNumber1 + 1;
          });
          setState(() {
            compareNumber2 = compareNumber2 + 1;
          });
        } else {
          setState(() {
            compareNumber1 = compareNumber1 + 1;
          });
          setState(() {
            compareNumber2 = compareNumber2 + 1;
          });
        }
      } else {
        if (swap) {
          setState(() {
            compareNumber1 = 0;
            compareNumber2 = 1;
          });
        } else {
          timer.cancel();
        }
      }
    });
  }

  insertionSort() async {
    compareNumber1 = compareNumber1 + 1;
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) async {
      if (compareNumber1 < numberList.length) {
        if (numberList[compareNumber1] > numberList[compareNumber1 - 1]) {
          setState(() {
            compareNumber1 = compareNumber1 + 1;
          });
        } else {
          int tmpPosition = compareNumber1;
          for (int i = compareNumber1 - 1; i >= 0; i--) {
            if (numberList[tmpPosition] < numberList[i]) {
              setState(() {
                int tmp = numberList[i];
                numberList[i] = numberList[tmpPosition];
                numberList[tmpPosition] = tmp;
                tmpPosition = tmpPosition - 1;
              });
            } else {
              break;
            }
          }
          setState(() {
            compareNumber1 = compareNumber1 + 1;
          });
        }
      }
    });
  }

  quickSort() async {
    int split = numberList[numberList.length - 1];
    List tmpList = numberList;
    int swap = 2;
    int lastSwap = 0;
    bool splitSort = false;
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) async {
      if (splitSort) {
      } else {
        if (compareNumber1 < numberList.length) {
          if (numberList[compareNumber1] <= split) {
          } else {
            for (int i = numberList.length - swap; i > compareNumber1; i--) {
              if (numberList[i] < split) {
                print('swap $compareNumber1  $i');
                setState(() {
                  lastSwap = compareNumber1 + 1;
                  int tmp = numberList[i];
                  numberList[i] = numberList[compareNumber1];
                  numberList[compareNumber1] = tmp;
                });
                break;
              }
            }
          }

          if (compareNumber1 == numberList.length - 1) {
            setState(() {
              int tmp = numberList[lastSwap];
              numberList[lastSwap] = numberList[numberList.length - 1];
              numberList[numberList.length - 1] = tmp;
              compareNumber1 = 0;
              splitSort = true;
            });
          }

          setState(() {
            compareNumber1 = compareNumber1 + 1;
          });
        }
      }
    });
  }

  choseSortType() {
    switch (widget.sortType) {
      case bubble:
        bubbleSort();
        return true;
      case insertion:
        print('here');
        insertionSort();
        return true;
      case quick:
        quickSort();
        return true;
      case selection:
        selectionSort();
        return true;
    }
  }

  selectionSort() {
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) async {
      if (compareNumber1 < numberList.length) {
        int minimalNumber = numberList[compareNumber1];
        int minimalNumberPosition = compareNumber1;
        for (int i = compareNumber1; i < numberList.length; i++) {
          if (minimalNumber < numberList[i]) {
            minimalNumber = numberList[i];
            minimalNumberPosition = i;
          }
          setState(() {
            compareNumber2 = i;
          });
        }
        setState(() {
          int tmp = numberList[compareNumber1];
          numberList[compareNumber1] = numberList[minimalNumberPosition];
          numberList[minimalNumberPosition] = tmp;
        });
        setState(() {
          compareNumber1 = compareNumber1 + 1;
        });
      }
    });
  }

  @override
  void initState() {
    numberList = _randomNumbers.generateRandomNumbers();
    choseSortType();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        title: Text('${widget.sortType} sort'),
      ),
      body: Consumer<AppProvider>(
        builder: (BuildContext context, AppProvider appConsumer, Widget child) {
          return Container(
            color: Colors.white,
            width: width,
            height: height,
            child: Center(
              child: Row(
                children: List.generate(numberList.length, (index) {
                  return Container(
                    width: width / 200,
                    height: numberList[index].toDouble() * 2,
                    color: index == compareNumber1 || index == compareNumber2
                        ? Theme.of(context).dialogBackgroundColor
                        : Theme.of(context).accentColor,
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
