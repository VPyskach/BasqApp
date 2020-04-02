import 'dart:math';
import 'dart:ui';

import 'package:basqapp/basquare_info.dart';
import 'package:basqapp/chat.dart';
import 'package:basqapp/contacts.dart';
import 'package:basqapp/custom_avatar.dart';
import 'package:basqapp/people.dart';
import 'package:basqapp/progress_border_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  List<Person> people = [];

  Person _getPerson(int i) {
    if (people.length > i)
      return people[i];
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    var dp = MediaQuery.of(context).size.height / 100;
//    var  appBarSize = MediaQuery.of(context).;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: 20 * dp,
            padding: EdgeInsets.only(top: 5 * dp, left: 2 * dp, right: 2 * dp),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                          height: 5 * dp,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> BasquareInfo()));
                                },
                                icon: Icon(Icons.info_outline,
                                color: Colors.teal,
                                size: 3 * dp
                              )))),
                      Center(
                        child: Container(
                          height: 5 * dp,
                          width: 20 * dp,
                          padding: EdgeInsets.only(left: 2 * dp, right: 2 * dp),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.5 * dp)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 3.0,
                                    spreadRadius: 1.0)
                              ]),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Icon(
                                  Icons.album,
                                  color: Colors.teal,
                                  size: 4 * dp
                                ),
                              ),
                              Expanded(
                                child: Icon(
                                  Icons.list,
                                  color: Colors.teal,
                                  size: 4 * dp
                                ),
                              ),
                              Expanded(
                                child: Icon(
                                  Icons.apps,
                                  color: Colors.teal,
                                  size: 4 * dp
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: dp),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 0.5 * dp, bottom: dp, left: dp, right: dp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.keyboard_arrow_up,
                                  color: Colors.lightGreen),
                              Text(
                                "EXTENDED",
                                style: TextStyle(color: Colors.lightGreen),
                              )
                            ],
                          ),
                        ),
                      ))
                ]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 80 * dp,
                  decoration: BoxDecoration(gradient: _bgGradient(dp)),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10 * dp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                            child: Row(children: <Widget>[
                          PersonView(_getPerson(6), 4),
                          PersonView(_getPerson(7), 6),
                          PersonView(_getPerson(8), 4)
                        ])),
                        Expanded(
                            child: Row(children: <Widget>[
                          PersonView(_getPerson(3), 3),
                          PersonView(_getPerson(4), 6),
                          PersonView(_getPerson(5), 3)
                        ])),
                        Expanded(
                            child: Row(children: <Widget>[
                          PersonView(_getPerson(0), 2),
                          PersonView(_getPerson(1), 6),
                          PersonView(_getPerson(2), 2)
                        ]))
                      ],
                    ),
                  )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToContacts(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _navigateToContacts(BuildContext context) async {
    List<Person> result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ContactsScreen()));
    if(result != null){
      people.clear();
      people = result;
    }
    setState(() {

    });
  }

  RadialGradient _bgGradient(double dp) => RadialGradient(
      colors: [
        Colors.white,
        Color.fromARGB(100, 249, 251, 252),
        Color.fromARGB(100, 188, 221, 216),
        Color.fromARGB(100, 249, 251, 252),
        Color.fromARGB(100, 188, 221, 216),
        Color.fromARGB(100, 249, 251, 252),
        Color.fromARGB(100, 188, 221, 216),
        Color.fromARGB(100, 242, 240, 242),
      ],
      radius: 0.4,
      stops: [0.1, 0.1, 0.4, 0.4, 0.7, 0.7, 1, 1],
      center: Alignment(0, 1.2),
      focal: Alignment(0, dp / 9),
      focalRadius: dp / 5);
}

class PersonView extends StatefulWidget {
  PersonView(this.person, this.paddingBottom);

  Person person;
  final double paddingBottom;

  @override
  PersonViewState createState() => PersonViewState();


}

class PersonViewState extends State<PersonView> with TickerProviderStateMixin {

  bool _showContent = false;
  double _borderProgress;
  AnimationController _progressAnimationController;
  AnimationController _scaleAnimationController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _borderProgress = 0;
      _showContent = false;
    });

    _setProgressAnimation();
    _setScaleAnimation();
    _startAfterRandomTime();
  }


  @override
  void didUpdateWidget(PersonView oldWidget) {
    setState(() {
      _borderProgress = 0;
      _showContent = false;
    });

    _setProgressAnimation();
    _setScaleAnimation();
    _startAfterRandomTime();
  }

  void _setProgressAnimation() {
    _progressAnimationController = AnimationController(
        vsync: this,
        duration: new Duration(
            milliseconds: widget.person == null ? 0 : (widget.person.progress * 5).round()))
      ..addListener(() {
        setState(() {
          _borderProgress = lerpDouble(
              0, widget.person.progress, _progressAnimationController.value);
        });
      });
  }

  void _setScaleAnimation() {
    _scaleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              _progressAnimationController.forward();
          });
  }

  void _startAfterRandomTime() async {
    await Future.delayed(Duration(milliseconds: Random().nextInt(2000)), () {
      if (widget.person != null) {
        _scaleAnimationController..forward();
        setState(() {
          _showContent = widget.person != null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dp = MediaQuery.of(context).size.height / 100;
    return !_showContent || widget.person == null
        ? Expanded(child: Container())
        : Expanded(
            child: Padding(
                padding: EdgeInsets.only(bottom: widget.paddingBottom * dp),
                child: ScaleTransition(
                    scale: _scaleAnimationController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              _navigateToChat(context, widget.person);
                            },
                            borderRadius: BorderRadius.circular(2*dp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.all(dp),
                                    child: CustomPaint(
                                        foregroundPainter:
                                            ProgressBorderPainter(
                                                lineColor: Colors.white,
                                                completeColor:
                                                    Colors.lightGreen,
                                                completePercent:
                                                    _borderProgress,
                                                width: 5.0),
                                        child: Padding(
                                            padding: EdgeInsets.all(0.7 * dp),
                                            child: CustomCircleAvatar(
                                              myImage:
                                                  NetworkImage(widget.person != null ? widget.person.photo : ""),
                                              initials: widget.person != null ? widget.person.firstName[0] +
                                                  widget.person.lastName[0] : "",
                                              radius: 3 * dp,
                                            )))),
                                Padding(
                                    padding: EdgeInsets.all(0.7 * dp),
                                    child: Text(
                                        widget.person != null ? widget.person.firstName : ""))
                              ],
                            ))
                      ],
                    ))));
  }

  void _navigateToChat(BuildContext context, Person person) {
    if (person != null)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatScreen(
                    person,
                  )));
  }
}
