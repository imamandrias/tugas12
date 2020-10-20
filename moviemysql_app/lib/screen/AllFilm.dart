import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moviemysql_app/model/model_film.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:moviemysql_app/model/model_film.dart';
import 'package:moviemysql_app/screen/DetailFilm.dart';
class PageAllFilm extends StatefulWidget {
  @override
  _PageAllFilmState createState() => _PageAllFilmState();
}

class _PageAllFilmState extends State<PageAllFilm> {
  //List Semua Film
  List<ModelFilm> listFilm = [];
  Future<Null> getFilm() async{
    //sesuaikan IP dengan IP Web Server
    final response = await http.get('http://192.168.1.100/movie_server/film.php');
    if(response.statusCode==200){
      final film = jsonDecode(response.body);
      //print(film);
      setState(() {
        for(Map i in film){
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
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            itemCount: listFilm.length,
              itemBuilder:(context, index){
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
              }
          ),
        ),
      ],
    );
  }
}

