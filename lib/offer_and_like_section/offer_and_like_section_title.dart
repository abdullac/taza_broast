

import 'package:flutter/material.dart';

class OfferAndLikeSectionTitle extends StatelessWidget {
  final String title;
  const OfferAndLikeSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}