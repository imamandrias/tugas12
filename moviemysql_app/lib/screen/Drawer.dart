import 'package:flutter/material.dart';
import 'package:moviemysql_app/main.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Colors.teal, Colors.tealAccent])),
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'gambar/nonton_anime.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ],
                )),
            CustomListTile(
                Icons.menu,
                'Home',
                    () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyHomePage()))),
          ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String judul;
  Function onTap;

  CustomListTile(this.icon, this.judul, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
        ),
        child: InkWell(
          splashColor: Colors.tealAccent,
          onTap: onTap,
          child: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        judul,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
