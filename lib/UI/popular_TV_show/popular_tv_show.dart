import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/UI/drawer/drawer.dart';
import 'package:sobat_test/UI/popular_TV_show/popular_tv_show_body.dart';
import 'package:sobat_test/bloc/popular_tv_show/popular_tv_show_bloc.dart';

class PopularTVShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return PopularTvShowBloc()..add(LoadData());
        })
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Popular Tv Show"),
          backgroundColor: Color(0xFF9a7857),
          elevation: 0,
        ),
        drawerScrimColor: Color(0xFFe5ceb9).withOpacity(0.4),
        drawer: MenuDrawer(pageIndex: 5,),
        body: PopularTVShowBody()
      ),
    );
  }

}