import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/UI/movie_detail/movie_detail.dart';
import 'package:sobat_test/UI/splash/loading.dart';
import 'package:sobat_test/bloc/upcoming_movie/upcoming_movie_bloc.dart';
import 'package:sobat_test/repo/repo_config.dart';

class HomeUpcomingMovieSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpcomingMovieBloc, UpcomingMovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is UpcomingMovieLoaded) {
            return SizedBox(
              height: 250.0,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.moviesResponse.results!.length,
                  itemBuilder: (BuildContext context, int index)
                  {
                    final movie = state.moviesResponse.results![index];
                    final getImagePath = RepoConfig().baseImageUrl;
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MovieDetail(movie: movie))
                        );
                      },
                      child: Container(
                          width: 150,
                          // color: Colors.greenAccent,
                          margin: const EdgeInsets.only(left: 5, top: 5),
                          child: Column(
                            children: [
                              Image.network(
                                getImagePath + movie.posterPath,
                                height: 200,
                              ),
                              RichText(
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  text: TextSpan(
                                      text: movie.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Color(0xFF235066)
                                      )
                                  )
                              )
                            ],
                          )
                      ),
                    );
                  }),
            );
          }
          else return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: CircularProgressIndicator(
                  strokeWidth: 7,
                backgroundColor: Color(0xFFcbaf97),
                color: Color(0xFF31637c),

              ),
            ),
          );
        }
    );
  }

}