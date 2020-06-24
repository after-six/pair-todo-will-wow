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

  ThemeData appTheme() {
    ThemeData base = ThemeData.light();
    return base.copyWith(
      canvasColor: Colors.black12,
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
  List highList = [
    {'check': false, 'title': 'sdfkjsldkjfls', 'subtitle': '2020.06.24'},
    {'check': false, 'title': 'will', 'subtitle': '2020.06.24'},
    {'check': false, 'title': 'wow', 'subtitle': '2020.06.24'}
  ];
  List mediumList = ["sdfkjsldkjfls", 'will', 'wow', 'teo', 'loo'];
  List lowList = ['sdfkjsldkjfls', 'will', 'wow', 'teo', 'loo'];

  Widget _listItem(Map obj, BuildContext context, int index) {
    return ListTile(
      leading: Checkbox(
        value: obj['check'],
        onChanged: (newValue) {
          setState(() {
            obj['check'] = newValue;
          });
        },
      ),
      title: Text(obj['title']),
      subtitle: Text(obj['subtitle']),
      trailing: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Checkbox(
                        value: obj['check'],
                        onChanged: (newValue) {
                          setState(() {
                            obj['check'] = newValue;
                          });
                        },
                      ),
                      title: Text(obj['title']),
                      subtitle: Text(obj['subtitle']),
                    ),
                    ListTile(
                      onTap: () {
                        print('update');
                      },
                      leading :
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                          ),
                        ),
                      title: Text('수정'),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          highList.removeAt(index);
                          Navigator.pop(context);
                        });

                      },
                      leading :
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                      ),
                      title: Text('삭제'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: Icon(Icons.more_vert),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        heightFactor: double.infinity,
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  itemCount: highList.length,
                  itemBuilder: (context, index) {
                    return _listItem(highList[index], context, index);
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo.shade700,
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Text('asdfasdfa'),
                    Text('asdfasdfa'),
                    Text('asdfasdfa'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
