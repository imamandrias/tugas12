import 'package:flutter/material.dart';
import 'package:moviemysql_app/model/model_film.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:moviemysql_app/screen/DetailFilm.dart';

class DetailKatagori extends StatefulWidget {
  final int idKatagori;
  final String namaKatagori;

  DetailKatagori(this.idKatagori, this.namaKatagori);

  @override
  _DetailKatagoriState createState() => _DetailKatagoriState();
}

class _DetailKatagoriState extends State<DetailKatagori> {
  List<ModelFilm> listFilm = [];

  Future<Null> getFilm() async {
    //sesuaikan IP dengan IP Web Server
    final response = await http.post(
        'http://192.168.1.100/movie_server/film_katagori.php',
        body: {'id_katagori': widget.idKatagori.toString()});
    if (response.statusCode == 200) {
      final film = jsonDecode(response.body);
      //print(film);
      setState(() {
        for (Map i in film) {
          //menambahkan data json ke list
          listFilm.add(ModelFilm.fromJson(i));
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFilm();
    widget.idKatagori.toString();
    widget.namaKatagori;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nonton Anime Apps',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              widget.namaKatagori,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24,),
            Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listFilm.length,
                  itemBuilder: (context, index) {
                    final nDataFilm = listFilm[index];
                    return Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DetailFilm(listFilm, index);
                          }));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    color: Colors.black26,
                                  )],
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(nDataFilm.gambarUrl),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child:Text(
                                  nDataFilm.namaMovie,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0
                                  ),
                                ),
                              ),
                              Card(
                                child:Text(
                                  'Katagori:  '+nDataFilm.namaKatagori,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Card(
                                child:Text(
                                  'Durasi:  '+nDataFilm.durasi,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Card(
                                child:Text(
                                  'Rating:  '+nDataFilm.rating.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0,),
                            ],
                          ),
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
