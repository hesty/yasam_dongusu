import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_dongusu/files/cinsiyet.dart';
import 'package:yasam_dongusu/files/constants.dart';
import 'package:yasam_dongusu/files/my_container.dart';
import 'package:yasam_dongusu/files/result_page.dart';
import 'package:yasam_dongusu/files/user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double icilenSigara = 10.0;
  double sporGunu = 3;
  int boy = 150;
  int kilo = 60;
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                  child: buildRowOutlineButton("BOY"),
                )),
                Expanded(
                    child: MyContainer(
                  child: buildRowOutlineButton("KİLO"),
                )),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Haftada kaç gün spor yapıyorsunuz:",
                    style: kMetinStili,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    sporGunu.round().toString(),
                    style: kSayiStili,
                  ),
                  Slider(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: sporGunu,
                      onChanged: (double newValue) {
                        setState(() {
                          sporGunu = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
              child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Günde kaç tane sigara içiyorsunuz:",
                  style: kMetinStili,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  icilenSigara.round().toString(),
                  style: kSayiStili,
                ),
                Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    })
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "KADIN";
                      });
                    },
                    renk: seciliCinsiyet == "KADIN"
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: Cinsiyet(
                      cinsiyet: "KADIN",
                      iconCinsiyet: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    renk: seciliCinsiyet == "ERKEK"
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: Cinsiyet(
                      cinsiyet: "ERKEK",
                      iconCinsiyet: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ignore: deprecated_member_use
          FlatButton(
            height: 50,
            color: Colors.white,
            onPressed: () {
              if (seciliCinsiyet == "ERKEK") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                          boy: boy,
                          icilenSigara: icilenSigara,
                          kilo: kilo,
                          seciliCinsiyet: seciliCinsiyet,
                          sporGunu: sporGunu),
                    ),
                  ),
                );
              } else if (seciliCinsiyet == "KADIN") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                          boy: boy,
                          icilenSigara: icilenSigara,
                          kilo: kilo,
                          seciliCinsiyet: seciliCinsiyet,
                          sporGunu: sporGunu),
                    ),
                  ),
                );
              } else {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:
                            Text("Lütfen Cinsiyet Seçiniz", style: kMetinStili),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Seç",
                                style: kMetinStili.copyWith(
                                    color: Colors.lightBlue)),
                          )
                        ],
                      );
                    });
              }
            },
            child: Text("HESAPLA", style: kMetinStili),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'YAŞAM BEKLENTİSİ',
        style: TextStyle(color: Colors.black54),
      ),
      centerTitle: true,
    );
  }

  buildRowOutlineButton(
    String label,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: 0,
              child: Text(
                label,
                style: kMetinStili,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            RotatedBox(
              quarterTurns: 0,
              child: Text(label == "BOY" ? boy.toString() : kilo.toString(),
                  style: kSayiStili),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onLongPressStart: (details) {
                Timer.periodic(Duration(milliseconds: 100), (timer) {
                  setState(() {
                    _timer = timer;
                    label == "BOY" ? boy++ : kilo++;
                  });
                });
              },
              onLongPressEnd: (details) {
                _timer.cancel();
              },
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(40, 40),
                    side: BorderSide(
                      color: Colors.lightBlue,
                    )),
                child: Icon(FontAwesomeIcons.plus, size: 10),
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy++ : kilo++;
                  });
                },
              ),
            ),
            GestureDetector(
              onLongPressStart: (details) {
                Timer.periodic(Duration(milliseconds: 100), (timer) {
                  setState(() {
                    _timer = timer;
                    label == "BOY" ? boy-- : kilo--;
                  });
                });
              },
              onLongPressEnd: (details) {
                _timer.cancel();
              },
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(40, 40),
                      side: BorderSide(
                        color: Colors.lightBlue,
                      )),
                  child: Icon(FontAwesomeIcons.minus, size: 10),
                  onPressed: () {
                    setState(() {
                      label == "BOY" ? boy-- : kilo--;
                    });
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
