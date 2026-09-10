import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
   ErrorIndicator([this.message = 'Something went wrong!']);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
