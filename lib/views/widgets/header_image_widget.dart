import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  const HeaderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assests/river.jpeg',
      width: double.infinity,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}