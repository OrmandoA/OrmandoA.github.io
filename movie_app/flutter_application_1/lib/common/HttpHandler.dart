import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/common/Constants.dart';
import 'package:flutter_application_1/model/Media.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  final String _baseUrl = 'api.themoviedb.org';
  final String _lenguage = 'es-ES';

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies() {
    var uri = Uri.https(_baseUrl, "3/movie/popular", {
      'api_key': "686f0f93f0f34bc28e5e257971666166",
      "page": "1",
      'language': "es-ES",
    });
    return getJson(uri).then(
        (data) => data['results'].map<Media>((item) => Media(item)).toList());
  }
}
