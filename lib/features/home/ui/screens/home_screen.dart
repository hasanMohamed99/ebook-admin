import 'package:flutter/material.dart';
import '../views/desktop_view.dart';
import '../views/mobile_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return const MobileView();
        } else {
          return const DesktopView();
        }
      },
    );
  }
}
