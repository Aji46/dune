import 'package:flutter/material.dart';

import '../widgets/home/location_section.dart';

class VisitScreen extends StatelessWidget {
  const VisitScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: const LocationSection(),
    );
  }
}
