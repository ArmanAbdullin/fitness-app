import 'package:flutter/material.dart';
import 'package:daywork/domains/workaut.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('IRON HOUSE'),
          leading: Icon(Icons.fitness_center),
        ),
        body: WorkautsList(),
      ),
    );
  }
}

class WorkautsList extends StatelessWidget {
  final workauts = <Workaut>[
    Workaut('test1', 'Arma1', 'Test Workaut1', 'beginner'),
    Workaut('test2', 'Arma2', 'Test Workaut2', 'intermedia'),
    Workaut('test3', 'Arma3', 'Test Workaut3', 'advanced'),
    Workaut('test4', 'Arma4', 'Test Workaut4', 'advanced'),
    Workaut('test5', 'Arma5', 'Test Workaut5', 'intermedia'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workauts.length,
          itemBuilder: (context, i) {
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.fitness_center,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(width: 1, color: Colors.white24))),
                  ),
                  title: Text(
                    workauts[i].title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  subtitle: subtitle(context, workauts[i]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workaut workaut) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workaut.level) {
    case 'beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;

    case 'intermedia':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;

    case 'advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white30,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 3,
        child: Text(
          workaut.level,
          style: TextStyle(color: Colors.white24),
        ),
      ),
    ],
  );
}
