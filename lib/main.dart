import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sort/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.purple,
        dialogBackgroundColor: Colors.orange,
        splashColor: Colors.red,
        accentColor: Colors.black,
        primaryColor: Colors.green,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width*0.9,
              height: 50,
              child: PlatformButton(
                  child: Text('Bubble Sort', style: TextStyle(color: Colors.white),),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.pushNamed(context, bubbleSort)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: width*0.9,
              height: 50,
              child: PlatformButton(
                  child: Text('Insertion Sort', style: TextStyle(color: Colors.white),),
                  color: Theme.of(context).dialogBackgroundColor,
                  onPressed: () => Navigator.pushNamed(context, insertionSort)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: width*0.9,
              height: 50,
              child: PlatformButton(
                  child: Text('Quick Sort', style: TextStyle(color: Colors.white),),
                  color: Theme.of(context).canvasColor,
                  onPressed: () => Navigator.pushNamed(context, quickSort)),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
