import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/components/alerts/show_alert_component.dart';
import 'package:platosyplan/components/alerts/show_alert_for_request_component.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../components/components.dart';
import '../../../utils/forms/validators.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
    phoneController.addListener(() => setState(() {}));
  }   

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
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
              const _ChangeUserImage(),
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
                            label       : state.user?.name ?? 'nombre', 
                            controller  : nameController, 
                            keyboardType: TextInputType.text,
                            icon        :  Icons.person,
                            suffixText  : 'nombre',
                          ),
                          TextformfieldComponent(
                            label       : state.user?.email ?? 'correo', 
                            controller  : emailController, 
                            keyboardType: TextInputType.emailAddress,
                            icon        :  Icons.email,
                            validatorFunction: validateEmail, 
                            suffixText  : 'correo',
                          ),
                          TextformfieldComponent(
                            label       : '********', 
                            controller  : passwordController,
                            keyboardType: TextInputType.text,
                            isPassword  : state.hidePassword,
                            haveSuffixIcon  : true,
                            icon        : Icons.lock,
                            validatorFunction: validatePassword,
                            suffixText  : 'contraseña',
                          ),
                          TextformfieldComponent(
                            label       : state.user?.phone ?? 'celular', 
                            controller  : phoneController,
                            keyboardType: TextInputType.phone,
                            icon        : Icons.phone_iphone_rounded,
                            validatorFunction: validatePhoneNumber,
                            suffixText  : 'celular',
                          ),
                          const SizedBox(height: 20.0),
                          // -- Form Submit Button
                            ButtonComponent(
                            isLoading : state.isLoadingRequest,
                            minWidth  : double.infinity, 
                            minHeight : 45,
                            function  : (nameController.text.trim().isEmpty && emailController.text.trim().isEmpty && passwordController.text.trim().isEmpty && phoneController.text.trim().isEmpty) ? null : () async {
                              showDialog(
                                context: context, 
                                builder: (_) => ShowAlertForRequestComponent(
                                  title: 'Actualizar datos', 
                                  informationAlert: '¿Estas seguro que deseas actualizar los datos?',
                                  buttonAccept    : MaterialButton(

                                    textColor: Colors.blue,
                                    child    : const Text('Sí, deseo actualizarlo'),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      final AuthBloc authbloc = BlocProvider.of<AuthBloc>(context);
                                      try {
                                        authbloc.setIsLoadingRequest(isLoadingRequest: true);
                                        await authbloc.updateUser(
                                          name    : nameController.text, 
                                          email   : emailController.text, 
                                          password: passwordController.text, 
                                          phone   : phoneController.text
                                        );
                                        
                                        if (!context.mounted) return;
                                        Navigator.pushNamedAndRemoveUntil(context, 'navegation', (route) => false);       
                                        showDialog(
                                          context: context,
                                          builder: (_) => const ShowAlertComponent(
                                            title: 'Actualización realizada', 
                                            subtitle: 'El usuario a sido actualizado con exito'
                                          )
                                        );

                                      } catch (e) {
                                        if (!context.mounted) return;
                                         showDialog(
                                          context: context,
                                          builder: (_) => ShowAlertComponent(title: 'algo ha fallado', subtitle: e.toString())
                                        );
                                        return;
                                      } finally {
                                        authbloc.setIsLoadingRequest(isLoadingRequest: false);
                                      }
                                    }
                                  ),
                                )
                              );
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

class _ChangeUserImage extends StatelessWidget {
  const _ChangeUserImage();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}