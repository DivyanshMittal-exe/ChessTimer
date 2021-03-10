import 'package:flutter/material.dart';

import 'dart:ui';
import 'dart:async';


// ignore: non_constant_identifier_names
String global_name;
// ignore: non_constant_identifier_names
var global_base;
// ignore: non_constant_identifier_names
var global_increment;

String name;
var base;
var increment;

var control=0;
bool BlackT=false;
bool WhiteT=true;


// ignore: must_be_immutable
class TimerPg extends StatefulWidget {



  TimerPg(String name2, var base2, var increment2){
     name=name2;
     base=base2;
     increment=increment2;

  }



  @override
  TimerPgState createState() => TimerPgState();
}

class TimerPgState extends State<TimerPg> {


int Baset_Black=base*60*10;
 int Baset_White=base*60*10;

 int calcB=(base*60*10);

int msB,sB,mB,calcW,msW,sW,mW;




  String White_Time = "Henlo";
  String Black_Time = "Henlo"  ;


  void blck(){
    BlackT=true;
    WhiteT=false;
    Timer.periodic(
    Duration(
      milliseconds:100),


    (Timer Blk) {
      if (!mounted) return;
            setState(() {
              if(Baset_Black<1|| BlackT==false || control !=1){
                Blk.cancel();
                if(control==1 && BlackT == true){
                  _showMyDialogW();
                }
              }else{
                Baset_Black=Baset_Black-1;

                calcB= calcB-1;



              }
            });
        });




  }

void whit(){

  BlackT=false;
  WhiteT=true;

  Timer.periodic(
      Duration(
          milliseconds:100)
      ,


          (Timer Wht) {
            if (!mounted) return;
        setState(() {
          if(Baset_White<1 || WhiteT==false || control !=1){

            Wht.cancel();
            if(control==1 && WhiteT == true){
                      _showMyDialogB();
            }

          }else{

            Baset_White=Baset_White-1;



          }
        });
      });




}




Future<void> _showMyDialogW() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Congratulations White'),
        content: SingleChildScrollView(
          child: Text('Congratulations!!, white is victorious. Well played Black'),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _showMyDialogB() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Congratulations Black'),
        content: SingleChildScrollView(
          child: Text('Congratulations!!, black is victorious. Well played white'),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}













Icon fab = Icon(
    Icons.play_circle_outline_outlined ,);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          ((MediaQuery.of(context).size.height) / 15),
        ), // here the desired height
        child: AppBar(
          title: Text(name),
          backgroundColor: Color.fromARGB(255, 8, 103, 136),
        ),
      ),
      body: Column(
        children: <Widget>[
          /*Container(
            color: Colors.black26,
            width: MediaQuery. of(context). size. width,
            height: ((MediaQuery. of(context). size.height)*0.46)-8,
          ),*/

          Expanded(
            flex: 4,
            child:  RotatedBox(
              quarterTurns: 2,
              child: ButtonTheme(
                minWidth: double.infinity,
                height: double.infinity,
                child: RaisedButton(
                  textColor: Color.fromARGB(255, 248, 248, 248),

                  child:Text(
                      ((Baset_Black~/600)).toString() + ":" + ((Baset_Black-((Baset_Black~/600))*600)~/10).toString() + "." + (Baset_Black%10).toString()
                  ,style: TextStyle(
                    fontSize:MediaQuery.of(context).size.height/10,
                  ),

                  ),
                  color: Color.fromARGB(255, 94, 135, 53),
                  onPressed: () {
                          setState(() {

                          if(control== 1 && BlackT == true){
                            whit();
                            Baset_Black = Baset_Black + (10*increment);

                          // ignore: unnecessary_statements
                          }else{null;}


                          });
                  },


                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,

            child: ButtonTheme(
              minWidth: double.infinity,
              height: double.infinity,
              child: RaisedButton(
                color: Color.fromARGB(255, 166, 187, 132),

                child: IconButton(
                  iconSize: MediaQuery.of(context).size.height/11,
                  color: Color.fromARGB(255, 248, 248, 248),
                  icon:fab,


                ),
                onPressed: () {
                  setState(() {
                    control++;
                            if (control  == 1) {
                              setState(() {
                                fab = Icon(Icons.pause_circle_filled_sharp ,);
                                whit();
                              });

                                }else if (control== 2) {
                              fab = Icon(Icons.stop_circle_outlined ,);
                            }else if (control== 3) {
                              control =0;
                              Navigator.pop(context);
                            }



                          }
                    );

                },
              ),
            ),
          ),




          Expanded(
            flex: 4,

            child: ButtonTheme(
              minWidth: double.infinity,
              height: double.infinity,
              child: RaisedButton(
                textColor: Color.fromARGB(255, 86, 83, 82),
                child:Text(
                    ((Baset_White~/600)).toString() + ":" + ((Baset_White-((Baset_White~/600))*600)~/10).toString() + "." + (Baset_White%10).toString()

                  ,style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height/10,

                ),
                ),
                color: Color.fromARGB(255 ,238, 238, 210),
                onPressed: () {
                  setState(() {

                    if(control== 1 && WhiteT== true){
                                      blck();
                                    Baset_White = Baset_White + (10*increment);

                              // ignore: unnecessary_statements
                              }else{null;}


                  });

                },


              ),
            ),
          ),
        ],
      ),

    );
  }
}
