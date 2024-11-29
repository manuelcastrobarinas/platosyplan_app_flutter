import 'package:flutter/material.dart';
import 'package:platosyplan/components/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          flex  : 5,
          child : _LogoAndTitle()
        ),
        Expanded(
          flex  : 7,
          child : _LoginForm()
        ),
        Expanded(
          flex  : 2,
          child : _CreateAccount()
        ),
      ],
    );
  }
}

class _CreateAccount extends StatelessWidget {
  const _CreateAccount();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment : MainAxisAlignment.center,
      children: [   
        const Text("¿No tienes una cuenta?", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, 'register'),
          child: Text("Registrate", style: TextStyle(color: Colors.pink[600], fontSize: 17)),
        )
      ],
    );
  }
}

class _LoginForm extends StatelessWidget {

  const _LoginForm();

  @override
  Widget build(BuildContext context) {    
    final TextEditingController emailController     = TextEditingController();
    final TextEditingController passwordController  = TextEditingController();
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
            const Text("Login", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),),
            TextformfieldComponent(
              label       : 'Ingresa tu correo', 
              controller  : emailController, 
              keyboardType: TextInputType.emailAddress,
              icon        :  Icons.person,
            ),
            TextformfieldComponent(
              label       : 'Ingresa tu Contraseña', 
              controller  : passwordController,
              keyboardType: TextInputType.text,
              isPassword  : true,
              haveSuffixIcon  : true,
              icon        : Icons.lock,
            ),
            const Row(
              children: [
                Expanded(child: SizedBox()),
                Text("¿Olvidaste la contraseña?"),
              ],
            ),
            ButtonComponent(
              minWidth: double.infinity, 
              minHeight: 45,
              function: () => Navigator.pushNamed(context, 'navegation'), //TODO: HACER EL INICIO DE SESION
              text: 'Inicia Sesión',
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
          const Expanded(
            flex  : 2,
            child : Text("PREPARA TUS RECETAS", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))
          )
        ]
      ),
    );
  }
}