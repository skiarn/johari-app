import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insights',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Johari window'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _crossAxisCount = 2;
  List<Color> gridCardColors = [
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.blue
  ];
  List<String> gridXtitles = ["Known to self", "Not known to self"];
  List<String> gridYtitles = ["Known to others", "Not known to others"];

  List<String> content = ["Open or Arena", "Blind", "Facade", "Unknown"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: CustomScrollView(slivers: <Widget>[
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                //SliverGridDelegateWithMaxCrossAxisExtent(
                //maxCrossAxisExtent: 500.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                //childAspectRatio: 2.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext ctx, int index) {
                  return Container(
                    child: Stack(children: <Widget>[
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: MediaQuery.of(ctx).size.width /
                                  _crossAxisCount *
                                  0.8,
                              height: MediaQuery.of(ctx).size.width /
                                  _crossAxisCount *
                                  0.8,
                              child: Card(
                                  color: gridCardColors[
                                      (index % gridCardColors.length)],
                                  elevation: 10.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(content[index]))),
                                  )))),
                      index < _crossAxisCount
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                  gridXtitles[(index % gridXtitles.length)]))
                          : Container(),
                      (index % _crossAxisCount) == 0
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(gridYtitles[
                                    (((index ~/ _crossAxisCount) %
                                        gridYtitles.length))]),
                              ),
                            )
                          : Container(),
                    ]),
                  );
                },
                childCount: content.length,
              ),
            )
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
