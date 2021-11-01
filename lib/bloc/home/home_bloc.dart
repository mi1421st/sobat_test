import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sobat_test/model/movie_response.dart';
import 'package:sobat_test/repo/repo_config.dart';
import 'package:sobat_test/resource/path.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadData) {
        try {
          emit(HomeLoading());
          final response = await RepoConfig().get(path["top_rated_movie"]);
          print(response);
          emit(HomeLoaded(response));
        } catch (e) {
          print(e);
          emit(HomeError());
        }
      }
    });
  }
}
