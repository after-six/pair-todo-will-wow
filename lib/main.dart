import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo.shade600,
      ),
      home: MyHomePage(title: '하면 좋은 일'),
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
  List highList = ["sdfkjsldkjfls", 'will', 'wow','teo','loo'];
  List mediumList = ["sdfkjsldkjfls", 'will', 'wow','teo','loo'];
  List lowList = ["sdfkjsldkjfls", 'will', 'wow','teo','loo'];

  Widget _listItem(String text){
    return ListTile(
      title : Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
            child: Column(
                children: <Widget>[
                  Text('HIGH'),
                  Flexible(
                    child: ListView.builder(
                        itemCount: highList.length,
                        itemBuilder: (context, index){return _listItem(highList[index]); } ),
                  ),
                  Text('MEDIUM'),
                  Flexible(
                    child: ListView.builder(
                        itemCount: mediumList.length,
                        itemBuilder: (context, index){return _listItem(mediumList[index]); } ),
                  ),
                  Text('LOW'),
                  Flexible(
                    child: ListView.builder(
                        itemCount: lowList.length,
                        itemBuilder: (context, index){return _listItem(lowList[index]); } ),
                  ),
                ],
            ),
//              Column(
//                children: <Widget>[
//                  Text('HIGH'),
//                  Flexible(
//                    child: ListView.builder(
//                        itemCount: mediumList.length,
//                        itemBuilder: (context, index){return _listItem(mediumList[index]); } ),
//                  ),
//                ],
//              ),
//              Column(
//                children: <Widget>[
//                  Text('HIGH'),
//                  Flexible(
//                    child: ListView.builder(
//                        itemCount: lowList.length,
//                        itemBuilder: (context, index){return _listItem(lowList[index]); } ),
//                  ),
//                ],
//              ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo.shade700,
      ),
    );
  }
}
