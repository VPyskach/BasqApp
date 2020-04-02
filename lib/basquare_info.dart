import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BasquareInfo extends StatefulWidget{
  @override
  BasquareInfoState createState() => BasquareInfoState();

}

class BasquareInfoState extends State<BasquareInfo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text('BASQUARE INFO', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: "https://www.basquare.com/",
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }

}