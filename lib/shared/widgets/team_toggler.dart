import 'package:flutter/material.dart';
import 'package:simple_bet/shared/utils/screen_size.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    Key key,
    this.homeTeam = 'WSH',
    this.awayTeam = 'HOU',
    this.homeTeamPressed,
    this.awayTeamPressed,
    this.colorOne = Colors.black,
    this.colorTwo = Colors.white,
    this.textColorOne = Colors.black,
    this.textColorTwo = Colors.black,
  }) : super(key: key);

  final String homeTeam;

  final String awayTeam;

  final Function() homeTeamPressed;

  final Function() awayTeamPressed;

  final Color colorOne;

  final Color colorTwo;

  final Color textColorOne;

  final Color textColorTwo;

  @override
  Widget build(BuildContext context) {
    //
    final _width = ScreenQueries.instance.width(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorOne,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            height: _width * 0.12,
            width: _width * 0.2,
            child: Text(
              homeTeam,
              style: Theme.of(context).textTheme.title.copyWith(
                    color: textColorOne,
                  ),
            ),
          ),
          onTap: homeTeamPressed,
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorTwo,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            height: _width * 0.12,
            width: _width * 0.2,
            child: Text(
              awayTeam,
              style: Theme.of(context).textTheme.title.copyWith(
                    color: textColorTwo,
                  ),
            ),
          ),
          onTap: awayTeamPressed,
        ),
      ],
    );
  }
}
