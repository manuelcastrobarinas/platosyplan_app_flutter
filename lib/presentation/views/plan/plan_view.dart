import 'package:flutter/material.dart';
import 'package:platosyplan/components/navegation/drawer_component.dart';
import 'package:platosyplan/components/ui/header_component.dart';
import 'package:platosyplan/presentation/screens/screens.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const TextStyle titleStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 20, overflow: TextOverflow.ellipsis);

    return Scaffold(
      drawer : const DrawerComponent(),
      body   : SafeArea(
        child : Column(
          children: [
            HeaderComponent(size: size, titleStyle: titleStyle),
            const PlanScreen(),
          ],
        ),
      )
    );
  }
}