import 'package:flutter/material.dart';
import '../../views/views.dart';

final List<StatelessWidget> _screens = <StatelessWidget>[
  const AllRecetsView(),
  const AllRecetsView(),
  const ProfileView(),
];

  List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(label: 'Home',    icon: Icon(Icons.fastfood_outlined)),
    const BottomNavigationBarItem(label: 'Recetas', icon: Icon(Icons.menu_book_rounded)),
    const BottomNavigationBarItem(label: 'Perfil',  icon: Icon(Icons.person_2_rounded)),
  ];

  
class NavegationScreen extends StatefulWidget {
  const NavegationScreen({super.key});

  @override
  State<NavegationScreen> createState() => _NavegationScreenState();
}

class _NavegationScreenState extends State<NavegationScreen> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        items: _items,
        // backgroundColor     : Colors.blueGrey[900],
        // unselectedItemColor : Theme.of(context).primaryColorLight,
        // selectedItemColor   : Theme.of(context).primaryColor,
        backgroundColor     : Theme.of(context).primaryColorLight,
        unselectedItemColor : Colors.blueGrey[900],
        selectedItemColor   : Theme.of(context).primaryColor,
        selectedFontSize    : 16,   
      ),
      body: _screens[index],
    );
  }
}