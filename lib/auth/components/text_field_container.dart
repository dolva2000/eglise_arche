import 'package:flutter/material.dart';
import 'package:apparche/auth/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const TextFieldContainer({
    Key key,
    this.child,
    this.borderRadius = 29.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
 
      width: size.width * 0.8,
      
      child: child,
    );
  }
}
