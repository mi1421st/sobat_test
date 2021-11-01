import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sobat_test/model/movie_response.dart';
import 'package:sobat_test/repo/repo_config.dart';
import 'package:sobat_test/resource/path.dart';

part 'popular_tv_show_event.dart';
part 'popular_tv_show_state.dart';

class PopularTvShowBloc extends Bloc<PopularTvShowEvent, PopularTvShowState> {
  PopularTvShowBloc() : super(PopularTvShowInitial()) {
    on<PopularTvShowEvent>((event, emit) async {
      if (event is LoadData) {
        try {
          emit(PopularTvShowLoading());
          final response = await RepoConfig().get(path["popular_movie_section"]);
          print(response);
          emit(PopularTvShowLoaded(response));
        } catch (e) {
          print(e);
          emit(PopularTvShowError());
        }
      }
    });
  }
}
