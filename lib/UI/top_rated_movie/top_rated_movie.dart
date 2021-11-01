import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/UI/drawer/drawer.dart';
import 'package:sobat_test/UI/top_rated_movie/top_rated_movie_body.dart';
import 'package:sobat_test/bloc/top_rated_movie/top_rated_movie_bloc.dart';

class TopRatedMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) {
              return TopRatedMovieBloc()..add(LoadData());
            }
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Top Rated"),
          backgroundColor: Color(0xFF9a7857),
          elevation: 0,
        ),
        drawerScrimColor: Color(0xFFe5ceb9).withOpacity(0.4),
        drawer: MenuDrawer(pageIndex: 1,),
        body: Center(
          child: TopRatedMovieBody(),
        ),
      ),
    );
  }

}