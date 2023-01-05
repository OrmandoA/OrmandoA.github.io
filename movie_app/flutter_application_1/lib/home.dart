import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/media_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Movie"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Material()),
            ListTile(
              trailing: Icon(Icons.local_movies),
              title: Text("Peliculas"),
            ),
            Divider(height: 5),
            ListTile(
              trailing: Icon(Icons.live_tv),
              title: Text("Televión"),
            ),
            Divider(height: 5),
            ListTile(
              trailing: Icon(Icons.close),
              title: Text("Cerrar"),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: PageView(
        children: [
          MediaList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: 'Populares'),
      BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Próximamente'),
      BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Mejor valoradas'),
    ];
  }
}
