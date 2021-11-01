import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sobat_test/model/review.dart';
import 'package:sobat_test/repo/review_repo.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewInitial()) {
    final _reviewRepo = ReviewRepository();
    on<ReviewEvent>((event, emit) async {
      if(event is AddReview) {
        emit(ReviewLoading());
        await _reviewRepo.createReview(event.review);
      }
      if(event is LoadReview) {
        emit(ReviewLoading());
        await _reviewRepo.getReview(event.id);
        emit(ReviewLoading());
      }
      if(event is LoadAllReview) {
        emit(ReviewLoading());
        await _reviewRepo.getAllReview();
        emit(ReviewAllLoaded());
      }
    });
  }
}
