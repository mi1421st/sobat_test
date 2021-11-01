import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sobat_test/model/movie_response.dart';

class RepoConfig {
  final String baseUrl = "https://api.themoviedb.org/3";
  final String apiKey = "?api_key=3b21e4b728b399997c9f65ef10f8543b";

  final String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  Future<dynamic> get(String path, {Map<String, dynamic>? query}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + path + apiKey));
      print(response);
      return MoviesResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      throw Exception("Failed to load Products data");
    }
  }

  Future<dynamic> getImage(String path) async {
    return baseImageUrl + path;
  }
}
