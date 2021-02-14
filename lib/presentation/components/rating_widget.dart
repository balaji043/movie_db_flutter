import 'package:flutter/material.dart';

import '../app_colors.dart';

class RatingWidget extends StatelessWidget {
  final String voteAverage;

  const RatingWidget({Key key, this.voteAverage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Colors.white,
        border: Border.all(
          color: kPrimaryColor,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          voteAverage,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
