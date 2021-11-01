import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  final String posterPath;
  final bool adult;
  final String overview;
  final String releaseDate;
  final List? genreIds;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  Movie({
    this.posterPath = "",
    this.adult = false,
    this.overview = "",
    this.releaseDate = "",
    this.genreIds,
    this.id = -1,
    this.originalTitle = "",
    this.originalLanguage = "",
    this.title = "",
    this.backdropPath = "",
    this.popularity = 0,
    this.voteCount = 0,
    this.video = false,
    this.voteAverage = 0,
  });

  // factory Movie.fromJson(Map<String, dynamic> json) {
  //   return Movie(
  //     posterPath: json["poster_path"],
  //     adult: json['adult'],
  //     overview: json["overview"],
  //     releaseDate: json["release_date"],
  //     genreIds: (json["genre_ids"])?.map((e) => e as String).toList(),
  //     id: json["id"],
  //     originalTitle: json["original_title"],
  //     originalLanguage: json["original_language"],
  //     title: json['title'],
  //     backdropPath: json["backdrop_path"],
  //     popularity: json["popularity"],
  //     voteCount: json["vote_count"],
  //     video: json["video"],
  //     voteAverage: json["vote_average"],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     "poster_path": posterPath,
  //     "adult": adult,
  //     "overview": overview,
  //     "release_date": releaseDate,
  //     "genre_ids": genreIds,
  //     "id": id,
  //     "original_title": originalTitle,
  //     "original_language": originalLanguage,
  //     "title": title,
  //     "backdrop_path": backdropPath,
  //     "popularity": popularity,
  //     "vote_count": voteCount,
  //     "video": video,
  //     "vote_average": voteAverage
  //   };
  // }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return "Movie{poster_path: $posterPath, adult: $adult, overview: $overview,"
        "release_date: $releaseDate, genre_ids: $genreIds, id: $id, original_title: $originalTitle,"
        "original_language: $originalLanguage, title: $title, backdrop_path: $backdropPath,"
        "popularity: $popularity, vote_count: $voteCount, video: $video, vote_average: $voteAverage}";
  }

  // List<Movie> movieFromJson(String jsonData) {
  //   final data = json.decode(jsonData);
  //   return List<Movie>.from(data.map((item) => Movie.fromJson(item)));
  // }
}
