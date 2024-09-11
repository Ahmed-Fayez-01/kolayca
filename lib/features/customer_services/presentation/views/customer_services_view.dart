import 'package:flutter/material.dart';
import 'package:kolayca/features/customer_services/presentation/views/widgets/customer_services_view_body.dart';

class CustomerServicesView extends StatelessWidget {
  const CustomerServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      body: CustomerServicesViewBody(),
    );
  }
}
