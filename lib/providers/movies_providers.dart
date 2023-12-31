import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _lenguaje = 'es-MX';

  MoviesProvider() {
    getOnDispayMovies();
  }

  getOnDispayMovies() async{
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'lenguaje': _lenguaje,
      'page': '1',

    });

    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    print(decodeData);
    print(response.body);


  }
}