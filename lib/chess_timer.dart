import 'package:chess_timer/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class timing {
  String name;
  var base;
  var increment;

  timing(this.name, this.base, this.increment);
}

// ignore: camel_case_types
class chess_main extends StatefulWidget {
  @override
  _chess_mainState createState() => _chess_mainState();
}

// ignore: camel_case_types
class _chess_mainState extends State<chess_main> {
  List<timing> times = [
    timing("Bullet 1+0", 1, 0),
    timing("Bullet 2+1", 2, 1),
    timing("Blitz 3+0", 3, 0),
    timing("Blitz 3+2", 3, 2),
    timing("Blitz 5+0", 5, 0),
    timing("Blitz 5+3", 5, 3),
    timing("Rapid 10+0", 10, 0),
    timing("Rapid 10+5", 10, 5),
    timing("Rapid 15+10", 15, 10),
    timing("Classic 30+0", 30, 0),
    timing("Classic 30+20", 30, 20),
  ];


  TextEditingController _textFieldController2 = TextEditingController();

  Future<void> _askForNew2(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Increment'),

          content: TextField(
            keyboardType: TextInputType.number,
            controller: _textFieldController2,
            decoration: InputDecoration(hintText: "Time (in seconds)"),
            inputFormatters: <TextInputFormatter>[
              // ignore: deprecated_member_use
              WhitelistingTextInputFormatter.digitsOnly],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                int BASE = int.parse(_textFieldController.text);
                int INCRE = int.parse(_textFieldController2.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimerPg("Custom",BASE,INCRE)),);
              },
            ),
          ],
        );
      },
    );
  }

  TextEditingController _textFieldController = TextEditingController();

  Future<void> _askForNew(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter base time'),
          content: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
          // ignore: deprecated_member_use
          WhitelistingTextInputFormatter.digitsOnly],
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Time(in minutes)"),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                _askForNew2(context);
              },
            ),
          ],
        );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chess Timer"),
        backgroundColor: Color.fromARGB(255, 8, 103, 136),
      ),
      body: ListView.builder(
        itemCount: times.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(times[index].name),

            onTap: () {
              print("Tapped");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimerPg(times[index].name,times[index].base,times[index].increment)),);
            },

          );
        },

      ),
      floatingActionButton: FloatingActionButton.extended(
        icon:Icon(Icons.add),
        label: Text("Custom"),

        onPressed: () { _askForNew(context); },
      ),
    );
  }
}
