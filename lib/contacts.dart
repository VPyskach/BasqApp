import 'package:basqapp/people.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_avatar.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Person> startList = []..addAll(People().people);
  List<Person> contacts = []..addAll(People().people);

  int _getCountSelected() {
    int counter = 0;
    for (Person person in contacts) {
      if (person.isAdded) counter++;
    }
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    var dp = MediaQuery
        .of(context)
        .size
        .height / 100;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 5*dp),
          child: Stack(children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.all(1.5*dp),
                    padding: EdgeInsets.all(dp),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.teal),
                        )))),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 2 * dp),
                  child: Center(
                    child: Text(
                      "Add from Contacts",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 2.8 * dp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3 * dp),
                  child: Center(
                    child: Text(
                      "Add up to 9 peoples to your circles",
                      style:
                      TextStyle(color: Colors.black54, fontSize: 2.5 * dp),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(3 * dp)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, -1.0),
                              blurRadius: 3.0,
                              spreadRadius: 1.0)
                        ]),
                    margin: EdgeInsets.only(
                        top: 3 * dp, right: 4 * dp, left: 4 * dp),
                    height: 6 * dp,
                    child: TextField(
                      onChanged: (text) {
                        _filterText(text);
                      },
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: dp, horizontal: 2*dp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3 * dp),
                              ),
                              borderSide: BorderSide(
                                  width: 0, style: BorderStyle.none)),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey),
                          hintText: "Search Your Contacts",
                          fillColor: Colors.white),
                    )),
                Container(
                  height: 3 * dp,
                  margin: EdgeInsets.only(top: dp),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: Offset(0.0, 5.0),
                      blurRadius: 2.0,
                    )
                  ]),
                ),
                Expanded(
                    child: Container(
                      height: 90 * dp,
                      child: ListView.separated(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          return _buildItem(index, dp);
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                      ),
                    ))
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 6 * dp,
                  width: 45 * dp,
                  margin: EdgeInsets.only(bottom: 3 * dp),
                  child: RaisedButton(
                    color: Colors.lightGreen,
                    child: Text(
                      "ADD " + _getCountSelected().toString() + " PEOPLE",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context, _getAddedContacts());
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(3 * dp)),
                  )),
            )
          ]),
        ));
  }

  Widget _buildItem(int index, double dp) {
    return Container(
      height: 8 * dp,
      padding: EdgeInsets.symmetric(horizontal: 2 * dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomCircleAvatar(
            myImage: NetworkImage(contacts[index].photo),
            initials:
            contacts[index].firstName[0] + contacts[index].lastName[0],
            radius: 3 * dp,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  contacts[index].firstName + " " + contacts[index].lastName)),
          Expanded(
            child: Container(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      _iconAddRemoveClick(index);
                    },
                    icon: Icon(
                      contacts[index].isAdded
                          ? Icons.remove_circle
                          : Icons.add_circle_outline,
                      size: 4 * dp,
                    ),
                    color: Colors.lightGreen,
                  )),
            ),
          )
        ],
      ),
    );
  }

  _iconAddRemoveClick(int index) {
    if (contacts[index].isAdded || _getCountSelected() < 10)
      contacts[index].isAdded = !contacts[index].isAdded;
    setState(() {});
  }

  _filterText(String filter) {
    contacts.clear();
    for (Person person in startList) {
      String firstName = person.firstName.toLowerCase();
      String lastName = person.lastName.toLowerCase();
      if (firstName.contains(filter.toLowerCase()) ||
          lastName.contains(filter.toLowerCase())) contacts.add(person);
    }
    setState(() {});
  }

  List<Person> _getAddedContacts() {
    List<Person> result = [];
    for (Person person in contacts)
      if (person.isAdded)
        result.add(person);
    return result;
  }
}
