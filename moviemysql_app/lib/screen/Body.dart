import 'package:flutter/material.dart';
import 'package:moviemysql_app/screen/AllFilm.dart';
import 'package:moviemysql_app/screen/Katagori.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          KatagoriList(),
          PageAllFilm(),
        ],
      ),
    );
  }
}
