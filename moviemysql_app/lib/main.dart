import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemysql_app/model/Katagori.dart';
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


  Future<List> getKatagori() async {
    final response = await http.get(
        'http://localhost/movie_server/katagori.php');
    return json.decode(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Movie'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 36,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Home'),
                      FutureBuilder<List>(
                        future: getKatagori(),
                          builder: (context, snapshot){
                          if (snapshot.hasError) print(snapshot.error);
                          return snapshot.hasData ? ItemKatagori(list: snapshot.data,): 'Tidak Ada';
                          }
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemKatagori extends StatelessWidget {
  final List list;
  ItemKatagori({this.list});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
        itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){},
            child: Card(
              child: ListTile(
                title: Text(
                  list[index]['nama_katagori']
                ),
              ),
            ),
          ),
        );
        },
    );
  }
}
