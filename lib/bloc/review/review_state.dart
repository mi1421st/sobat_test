part of 'review_bloc.dart';

@immutable
abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewAllLoaded extends ReviewState {}

class ReviewLoaded extends ReviewState {}

class ReviewError extends ReviewState {}
