import 'dart:convert';

import 'package:sobat_test/model/movie.dart';

import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MoviesResponse {
  final int? page;
  final int? totalResults;
  final int? totalPages;
  final List<Movie>? results;

  MoviesResponse({this.page, this.totalResults, this.totalPages, this.results});

  // factory MoviesResponse.fromJson(Map<String, dynamic> json) {
  //   return MoviesResponse(
  //     page: json['page'],
  //     totalResults: json['total_results'],
  //     totalPages: json['total_pages'],
  //     results: (json['results'] as List<dynamic>?)
  //         ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'page': page,
  //     'total_results': totalResults,
  //     'total_pages': totalPages,
  //     'results': results
  //   };
  //

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);

  @override
  String toString() {
    return "page: $page, total_result: $totalResults, total_pages: $totalPages, reuslt: $results";
  }

  // List<MoviesResponse> moviesResponseFromJson(String jsonData) {
  //   final data = json.decode(jsonData);
  //   return List<MoviesResponse>.from(
  //       data.map((item) => MoviesResponse.fromJson(item)));
  // }
}
