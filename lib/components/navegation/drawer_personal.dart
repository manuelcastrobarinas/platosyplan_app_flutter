import 'package:flutter/material.dart';
import 'package:platosyplan/services/services.dart';

import '../../utils/legal/terms_and_conditions.dart';

class DrawerPersonal extends StatelessWidget {
  const DrawerPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child : ListView(
        children  : [
          const ListTile(  
            leading : Icon(Icons.text_snippet),  
            title   : Text('Políticas de privacidad'),
            onTap   : showTermnsAndConditions,
            trailing: Icon(Icons.arrow_drop_down_rounded),
          ),
          const Divider(),
          ListTile(  
            leading : const Icon(Icons.logout),  
            title   : const Text('Cerrar sesión'),
            onTap   : () async {
              await AuthService.deleteToken();
              if (!context.mounted) return ;
              Navigator.pushNamedAndRemoveUntil(context, 'introduction', (route) => false);
            },
            trailing: const Icon(Icons.arrow_drop_down_rounded),
          ),  
        ],
      )
    );
  }
}