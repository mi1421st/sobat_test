import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sobat_test/model/movie_response.dart';
import 'package:sobat_test/repo/repo_config.dart';
import 'package:sobat_test/resource/path.dart';

part 'upcoming_movie_event.dart';
part 'upcoming_movie_state.dart';

class UpcomingMovieBloc extends Bloc<UpcomingMovieEvent, UpcomingMovieState> {
  UpcomingMovieBloc() : super(UpcomingMovieInitial()) {
    on<UpcomingMovieEvent>((event, emit) async{
      if (event is LoadData) {
        try {
          emit(UpcomingMovieLoading());
          final response = await RepoConfig().get(path["upcoming_movie_section"]);
          print(response);
          emit(UpcomingMovieLoaded(response));
        } catch (e) {
          print(e);
          emit(UpcomingMovieError());
        }
      }
    });
  }
}
