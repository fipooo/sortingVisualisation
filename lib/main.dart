import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:sort/functions/randomNumbers.dart';
import 'package:sort/provider/provider.dart';
import 'package:sort/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MaterialApp(
        onGenerateRoute: Router.generateRoute,
        initialRoute: homeRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          cardColor: Colors.tealAccent,
          canvasColor: Colors.purple,
          dialogBackgroundColor: Colors.orange,
          splashColor: Colors.red,
          accentColor: Colors.black,
          primaryColor: Colors.green,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Provider<AppProvider>(
      create: (context) => AppProvider(),
      builder: (context, child) {
        return child;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width * 0.9,
                height: 50,
                child: PlatformButton(
                    child: Text(
                      'Bubble Sort',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      RandomNumbers _randomNumbers = new RandomNumbers();
                      Navigator.pushNamed(context, visualization,
                          arguments: 'bubble');
                      appProvider.numbersToSort =
                          _randomNumbers.generateRandomNumbers();
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: width * 0.9,
                height: 50,
                child: PlatformButton(
                    child: Text(
                      'Insertion Sort',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).dialogBackgroundColor,
                    onPressed: () {
                      RandomNumbers _randomNumbers = new RandomNumbers();
                      Navigator.pushNamed(context, visualization,
                          arguments: 'insertion');
                      appProvider.numbersToSort =
                          _randomNumbers.generateRandomNumbers();
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: width * 0.9,
                height: 50,
                child: PlatformButton(
                    child: Text(
                      'Quick Sort',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).canvasColor,
                    onPressed: () {
                      RandomNumbers _randomNumbers = new RandomNumbers();
                      Navigator.pushNamed(context, visualization,
                          arguments: 'quick');
                      appProvider.numbersToSort =
                          _randomNumbers.generateRandomNumbers();
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: width * 0.9,
                height: 50,
                child: PlatformButton(
                    child: Text(
                      'Selection Sort',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).cardColor,
                    onPressed: () {
                      RandomNumbers _randomNumbers = new RandomNumbers();
                      Navigator.pushNamed(context, visualization,
                          arguments: 'selection');
                      appProvider.numbersToSort =
                          _randomNumbers.generateRandomNumbers();
                    }),
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
