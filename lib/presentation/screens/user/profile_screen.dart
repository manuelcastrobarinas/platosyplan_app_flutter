import 'package:flutter/material.dart';
import 'package:platosyplan/components/button_component.dart';
import 'package:platosyplan/services/services.dart';

import '../../../components/profile/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Perfil', style:  TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage('assets/food/hamburgerBanner.jpg'), fit: BoxFit.cover)
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).primaryColor
                      ),
                      child: const Icon(Icons.edit, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("manuel castro",     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 2),
              const Text("manuel.castrobarinas@gmail.com",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)),
              const SizedBox(height: 20),
              /// -- BUTTON
              SizedBox(
                width: 200,
                child:  ButtonComponent(
                  borderRadius: 100,
                  minWidth: double.infinity, 
                  minHeight: 50, 
                  function: () => Navigator.pushNamed(context, 'editprofile'),
                  text: 'tEditProfile', 
                  isLoading: false,
                  backgroundColor: const Color(0xffff9500),
                )
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.black12),
              const SizedBox(height: 10),
              /// -- MENU
              ProfileMenuWidget(
                title: "Settings",
                icon: Icons.settings,
                onPress: () {}
              ),
              ProfileMenuWidget(
                title: "Tarjetas",
                icon: Icons.wallet,
                onPress: () {}
              ),
              ProfileMenuWidget(
                title: "User Management",
                icon: Icons.person_2_sharp,
                onPress: () {}
              ),
              const Divider(color: Colors.black12),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title : "Información",
                icon  : Icons.info_outline_rounded,
                onPress: () {}
              ),
              ProfileMenuWidget(
                title : "Cerrar sesión",
                icon  : Icons.logout_rounded,
                textColor: Theme.of(context).primaryColor,
                endIcon: false,
                onPress: () async {
                  AuthService.deleteToken();
                  Navigator.popAndPushNamed(context, 'login');
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
