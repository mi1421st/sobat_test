part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final MoviesResponse moviesResponse;

  HomeLoaded(this.moviesResponse);
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}
