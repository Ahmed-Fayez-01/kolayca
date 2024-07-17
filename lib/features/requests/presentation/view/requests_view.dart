import 'package:flutter/material.dart';
import 'package:kolayca/features/requests/presentation/widget/notiva_item.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 35),
          CustemHeaderWidget(text: 'الطلبات'),
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