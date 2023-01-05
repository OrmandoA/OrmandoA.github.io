import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/util.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);

  factory Media(Map jsonMap) {
    try {
      return Media.deserealize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  Media.deserealize(Map json)
      : id = json["id"].toInt(),
        voteAverage = json["vote_average"].toDouble(),
        title = json["title"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        releaseDate = json["releaseDate"],
        genreIds = json["genreIds"].toList();
}
