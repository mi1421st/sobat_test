import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/UI/drawer/drawer.dart';
import 'package:sobat_test/UI/popular_movie/popular_movie_body.dart';
import 'package:sobat_test/bloc/popular_movie/popular_movie_bloc.dart';

class PopularMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return PopularMovieBloc()..add(LoadData());
        })
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Popular Movie"),
          backgroundColor: Color(0xFF9a7857),
          elevation: 0,
        ),
        drawerScrimColor: Color(0xFFe5ceb9).withOpacity(0.4),
        drawer: MenuDrawer(pageIndex: 3,),
        body: PopularMovieBody()
      ),
    );
  }

}