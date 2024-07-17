import 'package:flutter/material.dart';

class CustemDivider extends StatelessWidget {
  const CustemDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 4,
      color: Colors.white,
      thickness: 1,
      endIndent: 10,
      indent: 10,
    );
  }
}
