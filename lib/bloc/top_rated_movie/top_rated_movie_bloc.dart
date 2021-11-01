import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sobat_test/model/movie_response.dart';
import 'package:sobat_test/repo/repo_config.dart';
import 'package:sobat_test/resource/path.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  TopRatedMovieBloc() : super(TopRatedMovieInitial()) {
    on<TopRatedMovieEvent>((event, emit) async {
      if (event is LoadData) {
        try {
          emit(TopRatedMovieLoading());
          final response = await RepoConfig().get(path["popular_movie_section"]);
          print(response);
          emit(TopRatedMovieLoaded(response));
        } catch (e) {
          print(e);
          emit(TopRatedMovieError());
        }
      }
    });
  }
}
