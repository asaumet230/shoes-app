import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final String title;
  final Color? color;
  final double? height;
  final double? widht;

  const CartButton({
    super.key,
    required this.title,
    this.color = Colors.orange,
    this.height = 100,
    this.widht = 100,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(color!),
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(widht!, height!),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
