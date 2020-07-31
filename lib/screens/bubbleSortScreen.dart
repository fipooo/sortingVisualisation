import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sort/functions/randomNumbers.dart';

class BubbleSortScreen extends StatefulWidget {
  @override
  _BubbleSortScreen createState() => _BubbleSortScreen();
}

class _BubbleSortScreen extends State<BubbleSortScreen> {
  RandomNumbers _randomNumbers = new RandomNumbers();
  List<int> numberList = new List();
  int compareNumber1 = 0;
  int compareNumber2 = 1;
  Timer timer;
  bool swap = false;


  @override
  void initState() {
    numberList = _randomNumbers.generateRandomNumbers();
    bubbleSort();
    super.initState();
  }

  bubbleSort() async{
    setState(() {
      swap = false;
    });
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) async {
      if(compareNumber2+1 <= numberList.length){
        if(numberList[compareNumber1] > numberList[compareNumber2]){
          int tmp = numberList[compareNumber2];
          setState(() {
            numberList[compareNumber2] = numberList[compareNumber1];
            numberList[compareNumber1] = tmp;
            swap = true;
          });
          setState((){compareNumber1=compareNumber1+1;});
          setState((){compareNumber2=compareNumber2+1;});
        }else{
          setState((){compareNumber1=compareNumber1+1;});
          setState((){compareNumber2=compareNumber2+1;});
        }
      }else{
        if(swap){
          setState(() {
            compareNumber1 = 0;
            compareNumber2 = 1;
          });
        }else{
          timer.cancel();
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
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Bobble Sort'),
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
                color: index==compareNumber1 || index == compareNumber2 ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
              );
            }),
          ),
        ),
      ),
    );
  }
}
