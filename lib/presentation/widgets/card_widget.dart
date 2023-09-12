import 'package:flutter/material.dart';
import 'package:users_list/core/constants/const.dart';

class CardWidget extends StatelessWidget {
  final String text;

  const CardWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isLandscape = size.width > size.height; 

    double cardWidth = isLandscape ? size.width * 0.5 : size.width * 0.7;
    double cardHeight = isLandscape ? size.height * 0.12 : size.height * 0.08;

    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        child: Center(
          child: Text(
            text,
            style: titlestyle,
          ),
        ),
      ),
    );
  }
}
