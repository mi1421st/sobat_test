import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/bloc/review/review_bloc.dart';
import 'package:sobat_test/model/movie.dart';
import 'package:sobat_test/repo/repo_config.dart';
import 'package:sobat_test/model/review.dart';

class MovieDetail extends StatefulWidget{
  MovieDetail({required this.movie});

  final Movie movie;

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final movie = widget.movie;
    final getImagePath = RepoConfig().baseImageUrl;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return ReviewBloc();
        })
      ],
      child: Scaffold(
        body: Stack(
          children: [
            Image.network(getImagePath + movie.posterPath),
            Align(
              alignment: Alignment.bottomCenter,
              child: DraggableScrollableSheet(
                  maxChildSize: 0.8,
                  minChildSize: 0.225,
                  initialChildSize: 0.225,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFBEBD8).withOpacity(0.7),
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
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 10.0,
                              sigmaY: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFCBAF97).withOpacity(0.35),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFCBAF97).withOpacity(0.35),
                                    spreadRadius: -1,
                                    blurRadius: 12,
                                    offset: Offset(0, 4), // changes position of shadow
                                  ),
                                ]),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                            movie.title,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF235066),
                                                fontWeight: FontWeight.w700,
                                                height: 1.0
                                            ),),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              text: TextSpan(
                                                  text: "Original title: ",
                                                  style: TextStyle(
                                                      fontWeight:FontWeight.w600,
                                                      fontSize: 14,
                                                      color: Color(0xFF7C4A31)),
                                                  children: [
                                                    TextSpan(
                                                      text: movie.originalTitle,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color(0xFF235066)),
                                                    ),
                                                  ]),
                                            ),
                                            RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              text: TextSpan(
                                                  text: "Original language: ",
                                                  style: TextStyle(
                                                      fontWeight:FontWeight.w600,
                                                      fontSize: 14,
                                                      color: Color(0xFF7C4A31)),
                                                  children: [
                                                    TextSpan(
                                                      text: movie.originalLanguage,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color(0xFF235066)),
                                                    ),
                                                  ]),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.whatshot,
                                                  color: Color(0xFFc92e74),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                RichText(
                                                    text: TextSpan(
                                                      text: "Hits  ",
                                                      style: TextStyle(
                                                        color: Color(0xFF662350),
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 16
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: movie.popularity.toString(),
                                                          style: TextStyle(
                                                              color: Color(0xFF23665b),
                                                              fontWeight: FontWeight.w500
                                                          ),
                                                        )
                                                      ]
                                                    )
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: width * 0.94,
                                              child: RichText(
                                                maxLines: 10,
                                                textAlign: TextAlign.justify,
                                                  text: TextSpan(
                                                    text: movie.overview,
                                                    style: TextStyle(
                                                      color: Color(0xFF235066)
                                                  )
                                                )
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                text: "Release Date: ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF7C4A31)),
                                                children: [
                                                  TextSpan(
                                                    text: movie.releaseDate,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      color: Color(0xFF235066)
                                                    )
                                                  )
                                                ]
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Preview",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF235066),
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.0
                                              ),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: width * 0.94,
                                              child: Image.network(
                                                getImagePath + movie.backdropPath,
                                                width: width * 0.9,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Review",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF235066),
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.0
                                              ),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0xFF235066)),
                                                overlayColor: MaterialStateProperty.all(Color(0xFFFBEBD8).withOpacity(0.25))
                                              ),
                                              onPressed: () {
                                                _showMyDialog(movie.id);
                                              },
                                              child: Container(
                                                width: width * 0.85,
                                                height: height * 0.07,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                        Icons.add,
                                                      size: 30,
                                                      color: Color(0xFFFBEBD8),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text(
                                                      "Add Review",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Color(0xFFFBEBD8),
                                                          fontWeight: FontWeight.w700,
                                                          height: 1.0
                                                      )),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ),
                        ),
                      ),
                    );
                  },
              ),
            )
          ],
        )
      ),
    );
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _reviewController = TextEditingController();
  String dropDownVal = "1⭐";

  Map dropDownValues = {
    "1⭐": 1,
    "2⭐": 2,
    "3⭐": 1,
    "4⭐": 2,
    "5⭐": 2,
  };

  Future<void> _showMyDialog(int id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Review'),
          content: SingleChildScrollView(
            child: ListBody(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        label: Text("Name")
                    ),
                  ),
                  TextField(
                    controller: _reviewController,
                    decoration: InputDecoration(
                        label: Text("Review")
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropDownVal,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownVal = newValue!;
                      });
                    },
                    items: <String>['1⭐', '2⭐', '3⭐', '4⭐','5⭐']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ]
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                // bloc.add(AddReview(review: Review(
                //     id: id,
                //     name: _nameController.text,
                //     review: _reviewController.text,
                //     rating: dropDownValues[dropDownVal]
                // )));
              },
            ),
          ],
        );
      },
    );
  }

}