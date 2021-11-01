part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent {}

class AddReview extends ReviewEvent {
  final Review review;

  AddReview({required this.review});
}

class UpdateReview extends ReviewEvent {}

class DeleteReview extends ReviewEvent {}

class DeleteAllReview extends ReviewEvent {}

class LoadReview extends ReviewEvent {
  final int id;

  LoadReview({required this.id});
}


class LoadAllReview extends ReviewEvent {}
