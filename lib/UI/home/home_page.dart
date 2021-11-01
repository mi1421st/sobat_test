import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/UI/drawer/drawer.dart';
import 'package:sobat_test/UI/home/popular_movie_section/popular_movie_section.dart';
import 'package:sobat_test/UI/home/top_rated_movie_section/top_rated_movie_section.dart';
import 'package:sobat_test/UI/home/upcoming_movie_section/upcoming_movie_section.dart';
import 'package:sobat_test/UI/splash/loading.dart';
import 'dart:async';

import 'package:sobat_test/bloc/popular_movie/popular_movie_bloc.dart' as pop;
import 'package:sobat_test/bloc/top_rated_movie/top_rated_movie_bloc.dart' as top;
import 'package:sobat_test/bloc/upcoming_movie/upcoming_movie_bloc.dart' as up;

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return pop.PopularMovieBloc()..add(pop.LoadData());
        }),
        BlocProvider(create: (context) {
          return top.TopRatedMovieBloc()..add(top.LoadData());
        }),
        BlocProvider(create: (context) {
          return up.UpcomingMovieBloc()..add(up.LoadData());
        }),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Color(0xFF9a7857),
          elevation: 0,
        ),
        drawerScrimColor: Color(0xFFe5ceb9).withOpacity(0.4),
        drawer: MenuDrawer(pageIndex: 0,),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Text(
                  "Top Rated Movie ",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF235066)
                  ),
                ),
              ),
              HomeTopRatedMovieSection(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Text(
                  "Popular Movie ",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF235066)
                  ),
                ),
              ),
              HomePopularMovieSection(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Text(
                  "Upcoming Movie ",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF235066)
                  ),
                ),
              ),
              HomeUpcomingMovieSection(),
            ],
          ),
        ),
      )
    );
  }
}
