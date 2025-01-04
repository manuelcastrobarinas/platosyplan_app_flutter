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
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: (int newIndex) {
              setState(() => index = newIndex);
            },
            items: _items,
            backgroundColor     : Theme.of(context).primaryColorLight,
            unselectedItemColor : Colors.blueGrey[900],
            selectedItemColor   : Theme.of(context).primaryColor,
            selectedFontSize    : 16,   
          ),
        ),
      ),
      body: _screens[index],
    );
  }
}