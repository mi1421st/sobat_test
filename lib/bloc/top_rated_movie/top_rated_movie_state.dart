part of 'top_rated_movie_bloc.dart';

@immutable
abstract class TopRatedMovieState {}

class TopRatedMovieInitial extends TopRatedMovieState {}

class TopRatedMovieLoaded extends TopRatedMovieState {
  final MoviesResponse moviesResponse;

  TopRatedMovieLoaded(this.moviesResponse);
}

class TopRatedMovieLoading extends TopRatedMovieState {}

class TopRatedMovieError extends TopRatedMovieState {}
