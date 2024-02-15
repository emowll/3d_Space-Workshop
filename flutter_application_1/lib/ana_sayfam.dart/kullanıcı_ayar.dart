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
                launch('tel:+905555555555');
              },child: Text("Beni Ara"),
            ),
            ElevatedButton(
              onPressed: (){
                launch('sms:+905555555555?body=Merhaba Emirhan');
              },child: Text("Sms gönder"),
            ),
            ElevatedButton(
              onPressed: (){
                launch('mailto:emirhnshn0@gmail.com?subject=Bşalığı Giriniz&body=Açıklama Giriniz');
              },child: Text("Email gönder"),
            ),
            ElevatedButton(
              onPressed: (){
                launch('https://www.instagram.com/emirhnshn0/');
              },child: Text("Instagram ile ulaş"),
            ),
          ],
        ),
      )
    );
  }
}
