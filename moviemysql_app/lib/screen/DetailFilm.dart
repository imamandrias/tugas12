import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemysql_app/model/model_film.dart';

class DetailFilm extends StatelessWidget {
  List<ModelFilm> listModel = [];
  int index;

  DetailFilm(this.listModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nonton Anime Apps', style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            height: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black26,
                )
              ],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(listModel[index].gambarUrl),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            listModel[index].namaMovie,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2.5),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 15,
                          color: Colors.teal,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          listModel[index].durasi,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 15,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        listModel[index].tahun.toString(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        listModel[index].rating.toString() + '/10',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.flag,
                        size: 15,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        listModel[index].negara,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Ulasan :',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            listModel[index].deskripsi,
            style: TextStyle(
                fontSize: 18, height: 1.5),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
