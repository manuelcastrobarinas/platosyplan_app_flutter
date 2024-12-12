import 'package:flutter/material.dart';

import '../../screens/screens.dart';


class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UpdateProfileScreen(),
    );
  }
}