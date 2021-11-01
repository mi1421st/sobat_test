part of 'top_rated_tv_show_bloc.dart';

@immutable
abstract class TopRatedTvShowState {}

class TopRatedTvShowInitial extends TopRatedTvShowState {}

class TopRatedTvShowLoaded extends TopRatedTvShowState {
  final MoviesResponse moviesResponse;

  TopRatedTvShowLoaded(this.moviesResponse);
}

class TopRatedTvShowLoading extends TopRatedTvShowState {}

class TopRatedTvShowError extends TopRatedTvShowState {}
