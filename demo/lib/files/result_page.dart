import 'package:flutter/material.dart';
import 'package:yasam_dongusu/files/constants.dart';
import 'package:yasam_dongusu/files/hesap.dart';
import 'package:yasam_dongusu/files/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text("Ortalama Yaşam Süreniz:", style: kMetinStili),
                ),
                Center(
                  child: Text(
                      Hesap(_userData).hesaplama().round().toString() +
                          " " +
                          "Yıl",
                      style: kMetinStili),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            // ignore: deprecated_member_use
            child: FlatButton(
              child: Text("GERİ DÖN", style: kMetinStili),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
