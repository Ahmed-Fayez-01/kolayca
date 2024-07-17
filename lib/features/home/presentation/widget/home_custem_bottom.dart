import 'package:flutter/material.dart';

class HomeCustemBottom extends StatelessWidget {
  const HomeCustemBottom({
    super.key,
    required this.image,
    this.onTap,
  });
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(image),
    );
  }
}
