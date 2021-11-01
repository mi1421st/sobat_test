import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sobat_test/UI/home/home_page.dart';
import 'package:sobat_test/UI/popular_TV_show/popular_tv_show.dart';
import 'package:sobat_test/UI/popular_movie/popular_movie.dart';
import 'package:sobat_test/UI/top_rated_TV_show/top_rated_tv_show.dart';
import 'package:sobat_test/UI/top_rated_movie/top_rated_movie.dart';
import 'package:sobat_test/UI/upcoming_movie/upcoming_movie.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.8,
      decoration: BoxDecoration(
          color: Color(0xFF9a7857).withOpacity(0.25),
          borderRadius:BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF85613c).withOpacity(0.25),
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
            width: width * 0.8,
            decoration: BoxDecoration(
                color: Color(0xFF9a7857).withOpacity(0.25),
                borderRadius:BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF85613c).withOpacity(0.25),
                    spreadRadius: -1,
                    blurRadius: 12,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ]),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    "assets/splash.jpg",
                    width: 84,
                    height: 108,
                  ),
                ),
                Container(
                  color: pageIndex == 0 ? Color(0xFF9a7857) : Colors.transparent,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF235066).withOpacity(0.5),
                                  spreadRadius: -1,
                                  blurRadius: 12,
                                  offset: Offset(0, 4), // changes position of shadow
                                ),
                              ]
                          ),
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "The Movie Database",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold ,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 6),
                                  blurRadius: 12.0,
                                  color: Color(0xFF235066).withOpacity(0.5),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: pageIndex == 1 ? Color(0xFF9a7857) : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TopRatedMoviePage()));
                    },
                    title: Text(
                      "Top Rated Movie",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 6),
                              blurRadius: 12.0,
                              color: Color(0xFF235066).withOpacity(0.5),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
                Container(
                  color: pageIndex == 2 ? Color(0xFF9a7857) : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpcomingMoviePage()));
                    },
                    title: Text(
                      "Upcoming Movie",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 6),
                              blurRadius: 12.0,
                              color: Color(0xFF235066).withOpacity(0.5),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
                Container(
                  color: pageIndex == 3 ? Color(0xFF9a7857) : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PopularMoviePage()));
                    },
                    title: Text(
                      "Popular Movie",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 6),
                              blurRadius: 12.0,
                              color: Color(0xFF235066).withOpacity(0.5),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
                Container(
                  color: pageIndex == 4 ? Color(0xFF9a7857) : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TopRatedTVShowPage()));
                    },
                    title: Text(
                      "Top rated TV show",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 6),
                              blurRadius: 12.0,
                              color: Color(0xFF235066).withOpacity(0.5),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
                Container(
                  color: pageIndex == 5 ? Color(0xFF9a7857) : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PopularTVShowPage()));
                    },
                    title: Text(
                      "Popular TV show",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 6),
                              blurRadius: 12.0,
                              color: Color(0xFF235066).withOpacity(0.5),
                            ),
                          ]
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}