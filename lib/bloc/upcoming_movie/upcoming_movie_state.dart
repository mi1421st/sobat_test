part of 'upcoming_movie_bloc.dart';

@immutable
abstract class UpcomingMovieState {}

class UpcomingMovieInitial extends UpcomingMovieState {}

class UpcomingMovieLoaded extends UpcomingMovieState {
  final MoviesResponse moviesResponse;

  UpcomingMovieLoaded(this.moviesResponse);
}

class UpcomingMovieLoading extends UpcomingMovieState {}

class UpcomingMovieError extends UpcomingMovieState {}
