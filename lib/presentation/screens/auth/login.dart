import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/components/alerts/show_alert_component.dart';
import 'package:platosyplan/components/components.dart';
import 'package:platosyplan/utils/forms/validators.dart';

import '../../../bloc/auth/auth_bloc.dart';

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
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    final TextEditingController emailController     = TextEditingController();
    final TextEditingController passwordController  = TextEditingController();

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  validatorFunction: validateEmail,
                ),
                TextformfieldComponent(
                  label       : 'Ingresa tu Contraseña', 
                  controller  : passwordController,
                  keyboardType: TextInputType.text,
                  isPassword  : state.hidePassword,
                  haveSuffixIcon  : true,
                  icon        : Icons.lock,
                  validatorFunction: validatePassword,
                ),
                const Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Text("¿Olvidaste la contraseña?"),
                  ],
                ),
                ButtonComponent(
                  isLoading: state.isLoadingRequest,
                  minWidth: double.infinity, 
                  minHeight: 45,
                  function: () async {
                    if(!formKey.currentState!.validate()) return ;
                    authBloc.setIsLoadingRequest(isLoadingRequest: true);
                    FocusScope.of(context).unfocus();                   
                    try {
                     await authBloc.loginSesion(
                        email   : emailController.text.trim(), 
                        password: passwordController.text.trim(),
                      );
                      if(!context.mounted) return;
                        authBloc.setIsLoadingRequest(isLoadingRequest: false);
                        Navigator.pushNamedAndRemoveUntil(context, 'navegation', (Route<dynamic> route) => false);
                        return;
                    } catch (e) {
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (_) =>  ShowAlertComponent(
                          title   : 'Algo salio mal al iniciar Sesión', 
                          subtitle: e.toString()
                          )
                        );
                      }
                    } finally {
                      authBloc.setIsLoadingRequest(isLoadingRequest: false);
                    }
                  } ,
                  text: 'Inicia Sesión',
                  backgroundColor: const Color(0xffff9500),
                  borderRadius: 5.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LogoAndTitle extends StatelessWidget {
  const _LogoAndTitle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width : MediaQuery.of(context).size.width* 0.79,
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex  : 2,
            child: SizedBox()
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
                child : Image.asset("assets/logo.png")
              ),
            Image.asset("assets/platosyplanfondo.png",fit: BoxFit.cover),
            ],
          ),
          const Text("PREPARA TUS RECETAS", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          const Expanded(child: SizedBox()),
        ]
      ),
    );
  }
}