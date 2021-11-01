// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      posterPath: json['poster_path'] as String? ?? "",
      adult: json['adult'] as bool? ?? false,
      overview: json['overview'] as String? ?? "",
      releaseDate: json['release_date'] as String? ?? "",
      genreIds: json['genre_ids'] as List<dynamic>?,
      id: json['id'] as int? ?? -1,
      originalTitle: json['original_title'] as String? ?? "",
      originalLanguage: json['original_language'] as String? ?? "",
      title: json['title'] as String? ?? "",
      backdropPath: json['backdrop_path'] as String? ?? "",
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
      voteCount: json['vote_count'] as int? ?? 0,
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
    };
