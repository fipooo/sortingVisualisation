import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sort/functions/randomNumbers.dart';

class QuickSortScreen extends StatefulWidget {
  @override
  _QuickSortScreen createState() => _QuickSortScreen();
}

class _QuickSortScreen extends State<QuickSortScreen> {
  RandomNumbers _randomNumbers = new RandomNumbers();
  List<int> numberList = new List();
  int compareNumber1 = 0;
  Timer timer;
  bool swap = false;


  @override
  void initState() {
    numberList = _randomNumbers.generateRandomNumbers();
    quickSort();
    super.initState();
  }

  quickSort() async{
    int split = numberList[numberList.length-1];
    List tmpList = numberList;
    int swap = 2;
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) async {

      if(numberList[compareNumber1] < split){
        compareNumber1 = compareNumber1+1;
      }
      else{
        for(int a =numberList.length-swap; a>compareNumber1; a--){
          if(numberList[a] < split){
            int tmp = numberList[a];
            setState(() {
              swap = swap+1;
              numberList[a] = numberList[compareNumber1];
              numberList[compareNumber1] = tmp;
            });
          }
        }
        compareNumber1 = compareNumber1+1;
      }
    });

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
        backgroundColor: Theme.of(context).canvasColor,
        title: Text('Quick Sort'),
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Center(
          child: Row(
            children: List.generate(numberList.length, (index){
              return Container(
                width: width/200,
                height: numberList[index].toDouble()*2,
                color: index==compareNumber1 ? Theme.of(context).canvasColor : Theme.of(context).accentColor,
              );
            }),
          ),
        ),
      ),
    );
  }
}
