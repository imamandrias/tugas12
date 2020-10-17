import 'dart:convert';
import 'package:http/http.dart' as http;

class Katagoris{
  final String id_katagori;
  final String nama_katagori;
  Katagoris({this.id_katagori, this.nama_katagori});

  factory Katagoris.fromJson(Map <String, dynamic> json){
    return new Katagoris(
      id_katagori: json['id_katagori'],
      nama_katagori: json['nama_katagori']
    );
  }
  //Konek API
  static Future<Katagoris> getKatagori() async{
    final response = await http.post('http://localhost/movie_server/katagori.php');


  }

}