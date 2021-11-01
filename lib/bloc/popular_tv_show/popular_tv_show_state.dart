part of 'popular_tv_show_bloc.dart';

@immutable
abstract class PopularTvShowState {}

class PopularTvShowInitial extends PopularTvShowState {}

class PopularTvShowLoaded extends PopularTvShowState {
  final MoviesResponse moviesResponse;

  PopularTvShowLoaded(this.moviesResponse);
}

class PopularTvShowLoading extends PopularTvShowState {}

class PopularTvShowError extends PopularTvShowState {}