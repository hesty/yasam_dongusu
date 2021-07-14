import 'package:flutter/material.dart';
import 'package:yasam_dongusu/files/constants.dart';

class Cinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData iconCinsiyet;

  Cinsiyet({this.cinsiyet, this.iconCinsiyet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconCinsiyet, size: 50, color: Colors.black54),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style: kMetinStili,
        ),
      ],
    );
  }
}
