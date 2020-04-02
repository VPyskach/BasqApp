import 'package:basqapp/people.dart';
import 'package:basqapp/progress_border_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_avatar.dart';
import 'home.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen(this.person);

  final Person person;

  @override
  Widget build(BuildContext context) {
    final dp = MediaQuery.of(context).size.height / 100;
    return Scaffold(
        body: Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 5 * dp),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 1.5 * dp, right: 1.5 * dp),
              height: 5 * dp,
              child: Stack(children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.teal,
                      ),
                    )),
                Center(
                  child: Text(
                    "Connection Starters",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 2.8 * dp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ])),
          Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 1.5 * dp, vertical: 3 * dp),
              child: Row(
                children: <Widget>[
                  CustomPaint(
                      foregroundPainter: ProgressBorderPainter(
                          lineColor: Colors.white,
                          completeColor: Colors.lightGreen,
                          completePercent: person.progress,
                          width: 0.5 * dp),
                      child: Padding(
                          padding: EdgeInsets.all(0.5 * dp),
                          child: CustomCircleAvatar(
                            myImage: NetworkImage(person.photo),
                            initials: person.firstName[0] + person.lastName[0],
                            radius: 2.5 * dp,
                          ))),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        person.firstName + " " + person.lastName,
                        style: TextStyle(
                            fontSize: 2.5 * dp, fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                    child: Container(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("6d ago ",
                                    style: TextStyle(color: Colors.teal)),
                                Icon(
                                  Icons.thumb_up,
                                  color: Colors.teal,
                                  size: 3 * dp,
                                )
                              ])),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 2.0,
                )
              ])),
          Expanded(
            child: Container(),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(2*dp),
                      child: new ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 300.0,
                          ),
                          child: new Scrollbar(
                            child: new SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                reverse: true,
                                child: Stack(
                                  children: <Widget>[
                                    TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 2*dp, horizontal: 2 * dp),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4 * dp),
                                              ),
                                              borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4 * dp),
                                              ),
                                              borderSide: BorderSide(color: Colors.lightGreen, width: 1.0)
                                          ),
                                          filled: true,
                                          hintStyle:
                                          TextStyle(color: Colors.grey),
                                          hintText: "Message...",
                                          fillColor: Colors.white70,
                                          suffixText: "SEND",
                                          suffixStyle: TextStyle(color: Colors.teal,)),
                                    ),
//                                    Align(
//                                      alignment: Alignment.centerRight,
//                                      child: Container(
//                                        padding: Ed,
//                                      ),
//                                    )
                                  ],
                                )
                                ),
                          ))))
            ],
          )
        ],
      ),
    ));
  }
}
