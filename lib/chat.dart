import 'package:basqapp/people.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key, this.person}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
      },
      child: Text(person.firstName + " " + person.lastName),
    );
  }

}