import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sobat_test/model/movie_response.dart';
import 'package:sobat_test/repo/repo_config.dart';
import 'package:sobat_test/resource/path.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  PopularMovieBloc() : super(PopularMovieInitial()) {
    on<PopularMovieEvent>((event, emit) async {
      if (event is LoadData) {
        try {
          emit(PopularMovieLoading());
          final response = await RepoConfig().get(path["popular_movie_section"]);
          print(response);
          emit(PopularMovieLoaded(response));
        } catch (e) {
          print(e);
          emit(PopularMovieError());
        }
      }
    });
  }
}
