import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/UI/drawer/drawer.dart';
import 'package:sobat_test/UI/upcoming_movie/upcoming_movie_body.dart';
import 'package:sobat_test/bloc/upcoming_movie/upcoming_movie_bloc.dart';

class UpcomingMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return UpcomingMovieBloc()..add(LoadData());
        })
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upcoming Movie"),
          backgroundColor: Color(0xFF9a7857),
          elevation: 0,
        ),
        drawerScrimColor: Color(0xFFe5ceb9).withOpacity(0.4),
        drawer: MenuDrawer(pageIndex: 2),
        body: UpcomingMovieBody()
      ),
    );
  }
}