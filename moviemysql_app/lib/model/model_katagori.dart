import 'dart:convert';

List<ModelKatagori> modelKatagoriFromJson (String string)=>
    List<ModelKatagori>.from(json.decode(string).map((x) => ModelKatagori.fromJson(x)));
String modelKatagoriToJson(List<ModelKatagori> data)=>json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class ModelKatagori {
  ModelKatagori({this.idKatagori, this.namaKatagori});
  int idKatagori;
  String namaKatagori;
  factory ModelKatagori.fromJson(Map<String, dynamic> json)=> ModelKatagori(
    idKatagori: json['id_katagori'],
    namaKatagori: json['nama_katagori']
  );
  Map<String, dynamic> toJson()=>{
    'id_katagori':idKatagori,
    'nama_katagori':namaKatagori
  };
}
