import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platosyplan/components/components.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          flex  : 3,
          child : _LogoAndTitle()
        ),
        Expanded(
          flex  : 8,
          child : _LoginForm()
        ),
        SizedBox(height: 20.0)
      ],
    );
  }
}

class _LoginForm extends StatelessWidget {

  const _LoginForm();

  @override
  Widget build(BuildContext context) {    
    final TextEditingController userController     = TextEditingController();
    final TextEditingController emailController     = TextEditingController();
    final TextEditingController passwordController  = TextEditingController();
    final TextEditingController phoneController     = TextEditingController();
    return Form(
      child: Container(
        height  : double.infinity,
        width   : double.infinity,
        margin  : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2.0),
        padding : const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        decoration: BoxDecoration(
          color : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const <BoxShadow> [
            BoxShadow(
              color : Colors.black26,
              blurRadius  : 3,
              spreadRadius: 1
            )
          ]
        ),    
        child : Column(
          mainAxisAlignment : MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Registrate", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),),
            TextformfieldComponent(
              label       : 'ingresa tu nombre', 
              controller  : userController, 
              keyboardType: TextInputType.text,
              icon        :  Icons.person,
            ),
            TextformfieldComponent(
              label       : 'Ingresa tu correo', 
              controller  : emailController, 
              keyboardType: TextInputType.emailAddress,
              icon        :  Icons.email,
            ),
            TextformfieldComponent(
              label       : 'Ingresa tu Contraseña', 
              controller  : passwordController,
              keyboardType: TextInputType.text,
              isPassword  : true,
              haveSuffixIcon  : true,
              icon        : Icons.lock,
            ),
            TextformfieldComponent(
              label       : 'celular', 
              controller  : phoneController,
              keyboardType: TextInputType.phone,
              icon        : Icons.phone_iphone_rounded,
            ),
             TextButton(
              onPressed: () async {
                Uri uri = Uri.parse('https://nebula-syrup-a0b.notion.site/T-rminos-y-condiciones-14deb7efedee8084be20ffbc1bea0074');
                try {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } catch (e) { 
                  if (kDebugMode) {
                    print("error abriendo esta chimbada $e");
                  }
                }
              },
              child: Text("terminos y condiciones", style: TextStyle(color: Colors.pink[600], fontSize: 17)),
            ),
            ButtonComponent(
              minWidth: double.infinity, 
              minHeight: 45,
              function: () => Navigator.pushNamed(context, 'login'), //TODO: HACER EL REGISTRO
              text: 'Registrarme',
              backgroundColor: const Color(0xffff9500),
              borderRadius: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoAndTitle extends StatelessWidget {
  const _LogoAndTitle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width : MediaQuery.of(context).size.width* 0.62,
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          Expanded(
            flex  : 4,
            child : Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child : Image.asset("assets/logo.png")
                ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.56,
                child: Image.asset("assets/platosyplanfondo.png")
              ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}