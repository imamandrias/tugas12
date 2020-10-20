import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:moviemysql_app/model/model_katagori.dart';
class KatagoriList extends StatefulWidget {
  @override
  _KatagoriListState createState() => _KatagoriListState();
}

class _KatagoriListState extends State<KatagoriList> {
  //List katagoris;
  List<ModelKatagori> listKatagori = [];
  int katagoriPilihan = 0;

  Future<Null> getKatagori() async {
    //sesuaikan IP dengan IP Web Server
    final response =
    await http.get('http://192.168.1.100/movie_server/katagori.php');
    if (response.statusCode == 200) {
      final katagori = jsonDecode(response.body);
      //print(katagori);
      setState(() {
        for (Map i in katagori) {
          //menambahkan data json ke list
          listKatagori.add(ModelKatagori.fromJson(i));
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listKatagori.length,
          itemBuilder: (context, i) {
            final nDataKatagori = listKatagori[i];
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
                          borderRadius: BorderRadius.circular(15.0),
                          color: i == katagoriPilihan ? Colors.cyan : Colors.transparent
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
