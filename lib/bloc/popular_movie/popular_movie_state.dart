part of 'popular_movie_bloc.dart';

@immutable
abstract class PopularMovieState {}

class PopularMovieInitial extends PopularMovieState {}

class PopularMovieLoaded extends PopularMovieState {
  final MoviesResponse moviesResponse;

  PopularMovieLoaded(this.moviesResponse);
}

class PopularMovieLoading extends PopularMovieState {}

class PopularMovieError extends PopularMovieState {}

