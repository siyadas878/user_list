import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String text;
  const CardWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.7,
      height: size.height*0.08,
      child: Card(
        child: Center(child: Text(text)),
      ),
    );
  }
}