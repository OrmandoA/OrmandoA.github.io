import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/HttpHandler.dart';
import 'package:flutter_application_1/model/Media.dart';

class MediaList extends StatefulWidget {
  const MediaList({super.key});

  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];
  @override
  void initiState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [Image.network(_media[index].getPosterUrl())],
          );
        },
      ),
    );
  }
}
