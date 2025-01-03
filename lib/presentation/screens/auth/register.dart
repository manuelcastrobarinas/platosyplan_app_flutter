import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/auth/auth_bloc.dart';
import 'package:platosyplan/components/alerts/show_alert_component.dart';
import 'package:platosyplan/components/components.dart';
import 'package:platosyplan/utils/forms/validators.dart';
import '../../../utils/legal/terms_and_conditions.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return const Column(
      children: [
        Expanded(flex: 3, child : _LogoAndTitle()),
        Expanded(flex: 8, child : _LoginForm()),
        SizedBox(height: 20.0)
      ],
    ); 
  }
}

class _LoginForm extends StatelessWidget {

  const _LoginForm();

  @override
  Widget build(BuildContext context) {    
    final TextEditingController nameController      = TextEditingController();
    final TextEditingController emailController     = TextEditingController();
    final TextEditingController passwordController  = TextEditingController();
    final TextEditingController phoneController     = TextEditingController();
    
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

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
                const Text("Registrate", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),),
                TextformfieldComponent(
                  label       : 'ingresa tu nombre', 
                  controller  : nameController, 
                  keyboardType: TextInputType.text,
                  icon        :  Icons.person,
                ),
                TextformfieldComponent(
                  label       : 'Ingresa tu correo', 
                  controller  : emailController, 
                  keyboardType: TextInputType.emailAddress,
                  icon        :  Icons.email,
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
                TextformfieldComponent(
                  label       : 'celular', 
                  controller  : phoneController,
                  keyboardType: TextInputType.phone,
                  icon        : Icons.phone_iphone_rounded,
                  validatorFunction: validatePhoneNumber,
                ),
                const _TermsAndConditions(),
                ButtonComponent(
                  isLoading : state.isLoadingRequest,
                  minWidth  : double.infinity, 
                  minHeight : 45,
                  function: () async {
                    if (!formKey.currentState!.validate()) return;

                    authBloc.setIsLoadingRequest(isLoadingRequest: true);
                    FocusScope.of(context).unfocus();
                    try {
                      await authBloc.registerNewUser(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        phone: phoneController.text.trim(),
                      );
                      if (!context.mounted) return;
                      Navigator.pushNamed(context, 'navegation');
                      return;
                    } catch (e) {
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (_) => ShowAlertComponent(
                          title: 'Error inesperado',
                          subtitle: e.toString(),
                          )
                        );
                      }
                    } finally {
                      authBloc.setIsLoadingRequest(isLoadingRequest: false);
                    }
                  },
                  text: 'Registrarme',
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

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: showTermnsAndConditions,
      child: Text("terminos y condiciones", style: TextStyle(color: Colors.pink[600], fontSize: 17)),
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
            flex  : 1,
            child : SizedBox(),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
                child : Image.asset("assets/logo.png")
              ),
              SizedBox(
                child: Image.asset("assets/platosyplanfondo.png")
              ),
            ],
          ),
          const Expanded(
            child : SizedBox(),
          ),
        ]
      ),
    );
  }
}