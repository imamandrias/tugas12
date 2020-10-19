import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemysql_app/model/model_katagori.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Player With MySql',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List katagoris;
  List<ModelKatagori> listModel = [];
  int katagoriPilihan = 0;

  Future<Null> getKatagori() async {
    final response =
        await http.get('http://192.168.1.101/movie_server/katagori.php');
    if (response.statusCode == 200) {
      final katagori = jsonDecode(response.body);
      print(katagori);
      setState(() {
        for (Map i in katagori) {
          //menambahkan data json ke list
          listModel.add(ModelKatagori.fromJson(i));
        }
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKatagori();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nonton Anime', style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Menu Katagori
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listModel.length,
                  itemBuilder: (context, i) {
                    final nDataKatagori = listModel[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            katagoriPilihan = i;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nDataKatagori.namaKatagori,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                color: i == katagoriPilihan ? Color(0xFF12153D) : Colors.black.withOpacity(0.4)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              height: 6,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: i == katagoriPilihan ? Color(0xFFFE6D8E) : Colors.transparent
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
