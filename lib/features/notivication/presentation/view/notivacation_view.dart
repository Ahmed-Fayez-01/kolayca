import 'package:flutter/material.dart';
import 'package:kolayca/features/requests/presentation/widget/notiva_item.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';

class NotivacationView extends StatelessWidget {
  const NotivacationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 35),
          CustemHeaderWidget(text: 'الاشعارات'),
          SizedBox(height: 20),
          NotiviacationItem(),
          NotiviacationItem(),
          NotiviacationItem(),
          NotiviacationItem(),
          NotiviacationItem(),
        ],
      ),
    );
  }
}