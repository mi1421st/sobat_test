import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobat_test/bloc/review/review_bloc.dart';

class DetailReviewSection extends StatefulWidget {
  final int id;

  DetailReviewSection({required this.id});

  @override
  _ReviewSectionState createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<DetailReviewSection> {
  @override
  void initState() {
    super.initState();
    context.read<ReviewBloc>().add(LoadReview(id: widget.id));
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocConsumer<ReviewBloc, ReviewState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              color: Colors.redAccent,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Name"),
                      Text("Rating")
                    ],
                  ),
                  Text("review")
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF235066))
              ),
              onPressed: () {},
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
        );
      },
    );
  }

}