import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    super.key,
    required this.goBack,
    required this.goNext,
  });

  final VoidCallback goBack;
  final VoidCallback goNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: goBack, // Use the callback
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          IconButton(
            onPressed: goNext, // Use the callback
            icon: Icon(Icons.arrow_forward),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}