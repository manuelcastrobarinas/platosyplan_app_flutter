import 'package:flutter/material.dart';
import 'package:platosyplan/presentation/views/plan/plan_view.dart';
import '../../views/views.dart';

final List<StatelessWidget> _screens = <StatelessWidget>[
  const PlanView(),
  const AllRecetsView(),
  const ProfileView(),
];

class NavegationScreen extends StatefulWidget {
  const NavegationScreen({super.key});

  @override
  State<NavegationScreen> createState() => _NavegationScreenState();
}

class _NavegationScreenState extends State<NavegationScreen> {

  int index = 0;

  Widget _buildNavItem(int itemIndex, IconData icon, String label) {
    final isSelected = index == itemIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => index = itemIndex),
        onDoubleTap: () => setState(() => index = itemIndex),
        onLongPress: () => setState(() => index = itemIndex),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: isSelected 
                  ? Theme.of(context).primaryColor 
                  : Colors.blueGrey[900],
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: isSelected ? 14 : 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected 
                    ? Theme.of(context).primaryColor 
                    : Colors.blueGrey[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: SizedBox(
          width: (MediaQuery.of(context).size.width > 600) ? MediaQuery.of(context).size.width * 0.37 : MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // Contenido principal
              _screens[index],
              // Barra de navegación posicionada absolutamente
              Positioned(
                left: 20.0,
                right: 20.0,
                bottom: 10.0 + MediaQuery.of(context).padding.bottom,
                child: SizedBox(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).primaryColorLight,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNavItem(0, Icons.fastfood_outlined, 'Plan'),
                        _buildNavItem(1, Icons.menu_book_rounded, 'Recetas'),
                        _buildNavItem(2, Icons.person_2_rounded, 'Perfil'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}