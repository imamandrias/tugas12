import 'dart:convert';

List<ModelFilm> modelFilmFromJson(String string) =>
    List<ModelFilm>.from(json.decode(string).map((x) => ModelFilm.fromJson(x)));

String modelFilmToJson(List<ModelFilm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelFilm {
  int idMovie;
  String namaMovie;
  int idKatagori;
  String gambarUrl;
  String movieUrl;
  String deskripsi;
  String tglRelease;
  int rating;
  String durasi;
  String negara;
  String namaKatagori;

  ModelFilm(
      {this.idMovie,
      this.namaMovie,
      this.idKatagori,
      this.gambarUrl,
      this.movieUrl,
      this.deskripsi,
      this.tglRelease,
      this.rating,
      this.durasi,
      this.negara,
      this.namaKatagori});

  factory ModelFilm.fromJson(Map<String, dynamic> json) => ModelFilm(
        idMovie: json['id_movie'],
        namaMovie: json['nama_movie'],
        idKatagori: json['id_katagori'],
        gambarUrl: json['gambar_url'],
        movieUrl: json['movie_url'],
        deskripsi: json['deskripsi'],
        tglRelease: json['tgl_release'],
        rating: json['rating'],
        durasi: json['durasi'],
        negara: json['negara'],
        namaKatagori: json['nama_katagori'],
      );

  Map<String, dynamic> toJson() => {
        'id_movie': idMovie,
        'nama_movie': namaMovie,
        'id_katagori': idKatagori,
        'gambar_url': gambarUrl,
        'movie_url': movieUrl,
        'deskripsi': deskripsi,
        'tgl_release': tglRelease,
        'rating': rating,
        'durasi': durasi,
        'negara': negara,
        'nama_katagori': namaKatagori,
      };
}
