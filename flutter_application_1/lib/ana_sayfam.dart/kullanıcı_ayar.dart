import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UlasimAraclari extends StatefulWidget {
  const UlasimAraclari({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UlasimAraclari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                launch('tel:+91 88888888888');
              },child: Text("Make A Call"),
            ),
            ElevatedButton(
              onPressed: (){
                launch('sms:+91888888888?body=Hi Welcome to Proto Coders Point');
              },child: Text("Send A SMS"),
            ),
            ElevatedButton(
              onPressed: (){
                launch('mailto:rajatrrpalankar@gmail.com?subject=This is Subject Title&body=This is Body of Email');
              },child: Text("Send A Email"),
            ),
            ElevatedButton(
              onPressed: (){
                launch('https://protocoderspoint.com/');
              },child: Text("Open a URL"),
            ),
          ],
        ),
      )
    );
  }
}