import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({Key? key, this.message}) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Column(
          children: [
            const Text("Oops"),
            Text(message!),
          ],
        ),
      ),
    );
  }
}
