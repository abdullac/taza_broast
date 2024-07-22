import 'package:flutter/material.dart';

class ContainerWithProperties extends StatelessWidget {
  final Color? customeColor;
  final Widget child;
  const ContainerWithProperties({
    super.key,
    required this.child,
    this.customeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: customeColor ?? Colors.red[100],
          borderRadius: BorderRadius.circular(5),
        ),
        child: child);
  }
}
