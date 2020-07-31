import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sort/functions/randomNumbers.dart';

class InsertionSortScreen extends StatefulWidget {
  @override
  _InsertionSortScreen createState() => _InsertionSortScreen();
}

class _InsertionSortScreen extends State<InsertionSortScreen> {
  RandomNumbers _randomNumbers = new RandomNumbers();
  List<int> numberList = new List();
  int compareNumber1 = 1;
  Timer timer;
  bool swap = false;


  @override
  void initState() {
    numberList = _randomNumbers.generateRandomNumbers();
    insertionSort();
    super.initState();
  }

  insertionSort() async{
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) async {
      if(compareNumber1 < numberList.length){
        if(numberList[compareNumber1] > numberList[compareNumber1-1]){
          setState(() {
            compareNumber1=compareNumber1+1;
          });
        }else{
          int tmpPosition = compareNumber1;
          for( int i = compareNumber1-1; i>=0; i--){
            if(numberList[tmpPosition] < numberList[i]){
              setState(() {
                int tmp = numberList[i];
                numberList[i] = numberList[tmpPosition];
                numberList[tmpPosition] = tmp;
                tmpPosition=tmpPosition-1;
              });
            }else{
              break;
            }
          }
          setState(() {
            compareNumber1=compareNumber1+1;
          });
        }
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
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        title: Text('Insertion Sort'),
      ),
      body: Container(
        color: Colors.white,
        width: width,
        height: height,
        child: Center(
          child: Row(
            children: List.generate(numberList.length, (index){
              return Container(
                width: width/200,
                height: numberList[index].toDouble()*2,
                color: index==compareNumber1 ? Theme.of(context).dialogBackgroundColor : Theme.of(context).accentColor,
              );
            }),
          ),
        ),
      ),
    );
  }
}
