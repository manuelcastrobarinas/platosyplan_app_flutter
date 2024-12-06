import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../components/components.dart';
import '../../../utils/forms/validators.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController nameController      = TextEditingController();
    final TextEditingController emailController     = TextEditingController();
    final TextEditingController passwordController  = TextEditingController();
    final TextEditingController phoneController     = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back_ios_new_rounded)
        ),
        title: const Text('Editar Perfil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment : MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width : 120,
                    height: 120,
                    child : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage("assets/food/hamburgerBanner.jpg"), fit: BoxFit.cover)
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100), color: Theme.of(context).primaryColor),
                      child: const Icon(Icons.camera, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // -- Form Fields
              Expanded(
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                          const SizedBox(height: 20.0),
                          // -- Form Submit Button
                            ButtonComponent(
                            isLoading : false,
                            minWidth  : double.infinity, 
                            minHeight : 45,
                            function: () async {
                              
                            },
                            text: 'Actualizar datos',
                            backgroundColor: const Color(0xffff9500),
                            borderRadius: 5.0,
                          ),      
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}