import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/UI/movie_detail/movie_detail.dart';
import 'package:sobat_test/UI/splash/loading.dart';
import 'package:sobat_test/bloc/top_rated_tv_show/top_rated_tv_show_bloc.dart';
import 'package:sobat_test/repo/repo_config.dart';

class TopRatedTVShowBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<TopRatedTvShowBloc, TopRatedTvShowState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is TopRatedTvShowLoaded) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Text(
                    "Top Rated Tv Show",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xFF235066)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Text("Showing " +
                      state.moviesResponse.results!.length.toString() +
                      " Movies",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF235066)
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    itemCount: state.moviesResponse.results!.length,
                    itemBuilder: (context, idx) {
                      final movie = state.moviesResponse.results![idx];
                      final getImagePath = RepoConfig().baseImageUrl;
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MovieDetail(movie: movie))
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: width * 0.9,
                            height: 500,
                            decoration: BoxDecoration(
                                color: Color(0xFFFBEBD8).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFCBAF97).withOpacity(0.3),
                                    spreadRadius: -1,
                                    blurRadius: 12,
                                    offset: Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ]),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  getImagePath + movie.posterPath,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 160,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFBEBD8).withOpacity(0.25),
                                          borderRadius:BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFCBAF97).withOpacity(0.25),
                                              spreadRadius: -1,
                                              blurRadius: 12,
                                              offset: Offset(0, 4), // changes position of shadow
                                            ),
                                          ]),
                                      child: ClipRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 10.0,
                                              sigmaY: 10.0),
                                          child: Container(
                                              width: width ,
                                              height: 150.0,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFCBAF97).withOpacity(0.15),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xFFCBAF97).withOpacity(0.25),
                                                      spreadRadius: -1,
                                                      blurRadius: 12,
                                                      offset: Offset(0, 4), // changes position of shadow
                                                    ),
                                                  ]),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  RichText(
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    text: TextSpan(
                                                      text: movie.title,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Color(0xFF235066),
                                                          fontWeight: FontWeight.w700,
                                                          height: 1.0
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  RichText(
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    text: TextSpan(
                                                        text:"original title: ",
                                                        style: TextStyle(
                                                            fontWeight:FontWeight.w600,
                                                            fontSize: 14,
                                                            color: Color(0xFF7C4A31)),
                                                        children: [
                                                          TextSpan(
                                                            text: "${movie.originalTitle}",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Color(0xFF235066)),
                                                          ),
                                                        ]),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    child: RichText(
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.justify,
                                                      text: TextSpan(
                                                          text: movie.overview,
                                                          style: TextStyle(
                                                              color: Color(0xFF235066)
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Container(
                                                      height: 35,
                                                      child: TextButton(
                                                        onPressed: (){},
                                                        child: Text(
                                                          "MORE>>",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: Color(0xFF7C4A31)
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                      );
                    })
              ],
            ),
          );
        }
        else return LoadingWidget();
      },
    );
  }

}