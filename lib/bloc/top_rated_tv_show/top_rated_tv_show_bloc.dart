import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sobat_test/model/movie_response.dart';
import 'package:sobat_test/repo/repo_config.dart';
import 'package:sobat_test/resource/path.dart';

part 'top_rated_tv_show_event.dart';
part 'top_rated_tv_show_state.dart';

class TopRatedTvShowBloc extends Bloc<TopRatedTvShowEvent, TopRatedTvShowState> {
  TopRatedTvShowBloc() : super(TopRatedTvShowInitial()) {
    on<TopRatedTvShowEvent>((event, emit) async {
      if (event is LoadData) {
        try {
          emit(TopRatedTvShowLoading());
          final response = await RepoConfig().get(path["top_rated_movie"]);
          print(response);
          emit(TopRatedTvShowLoaded(response));
        } catch (e) {
          print(e);
          emit(TopRatedTvShowError());
        }
      }
    });
  }
}
