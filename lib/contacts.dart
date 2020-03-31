import 'package:basqapp/people.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();

}

class _ContactsScreenState extends State<ContactsScreen> {

  List<Person> contactsList = People().people;

  @override
  Widget build(BuildContext context) {
    var dp = MediaQuery
        .of(context)
        .size
        .height / 100;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 30),
          child: Stack(children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
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
                  margin: EdgeInsets.only(top: 2 * dp),
                  child: Center(
                    child: Text(
                      "Add up to 10 peoples to your circles",
                      style: TextStyle(color: Colors.black54, fontSize: 2 * dp),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(3 * dp)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, -2.0),
                              blurRadius: 3.0,
                              spreadRadius: 1.0
                          )
                        ]),
                    margin: EdgeInsets.only(
                        top: 2 * dp, right: 4 * dp, left: 4 * dp),
                    height: 6 * dp,
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3 * dp),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.white, width: 0.0)
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey),
                          hintText: "Type in your text",
                          fillColor: Colors.white),
                    )),
                Container(
                  height: 3 * dp,
                  margin: EdgeInsets.only(top: dp),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(0.0, 5.0),
                          blurRadius: 2.0,
                        )
                      ]),
                ),
                Container(
                  child: ListView.separated(
                      itemCount: contactsList.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(contactsList[index].firstName + " " + contactsList[index].lastName),
//                          leading: Icon(
//                            Icons.person,
//                            color: Colors.lightGreen,
//
//                          ),
//                          trailing: Icon(
//                            contactsList[index].isAdded ? Icons.add_circle_outline: Icons.remove_circle,
//                            color: Colors.lightGreen,
//                          ),
                        );
                      },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },),
                )
              ],
            )
          ]),
        ));
  }

  List<Widget> _buildContactsList() {
    return contactsList.map((Person e) => ListTile(
      title: Text(e.firstName + " " + e.lastName),
      leading: Icon(
        Icons.person,
        color: Colors.lightGreen,

      ),
      trailing: Icon(
        e.isAdded ? Icons.add_circle_outline: Icons.remove_circle,
        color: Colors.lightGreen,
      ),
    )).toList();
  }
}
