import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(MyApp());
}
final route = {
  '/': (context) => MyHomePage(title: '하면 좋은 일'),
  '/create': (context) => MyNewTodo()
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo.shade600,
      ),
      routes:route ,
    );
  }

  ThemeData appTheme() {
    ThemeData base = ThemeData.light();
    return base.copyWith(
      canvasColor: Colors.black12,
    );
  }
}

class MyNewTodo extends StatefulWidget {
  @override
  MyNewTodoWidget createState() => MyNewTodoWidget();
}

final DateTime now = DateTime.now();

class MyNewTodoWidget extends State<MyNewTodo> {
  String dropdownValue = 'High';
  String destination = DateFormat('yyyy.MM.dd H:m').format(now);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('저장'),
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.transparent,
              ),
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("일 벌리기"),

      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child:
            Column(
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(hintText: '제목', border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                    ))
                ),
                Text('제목을 입력해주세요',
                  textAlign: TextAlign.left,
                )
              ],
            )
        ,
          ),
          TextField(
            decoration: InputDecoration(hintText: '제목'),
          ),
          DropdownButton(
            value: dropdownValue,
            icon: Icon(
              Icons.arrow_drop_down,
            ),
            items: <String>['High', 'Medium', 'Low'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
          ),
          FlatButton(
            child: Text(destination),
            onPressed: () {
              showDatePicker(context: context, initialDate: now, firstDate: DateTime(2010), lastDate: DateTime(2100), builder: (BuildContext context, Widget child){
                return Theme(
                  data : ThemeData.light(),
                  child : child
                );
              });
            },
          )
        ],
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
                      leading: IconButton(
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
                      leading: IconButton(
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
          Navigator.pushNamed(context, "/create");
        },
      ),
    );
  }
}
