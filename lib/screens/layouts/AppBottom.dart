import 'package:flutter/material.dart';
import 'package:healthclick_app/screens/pharmacy/Pharmacy.dart';
import 'package:healthclick_app/screens/product/Product.dart';
import 'package:healthclick_app/screens/profile/Profile.dart';
import 'package:healthclick_app/screens/welcome/HomePage.dart';

class AppBottomNav extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _AppBottomNavState createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  final List<Widget> _screens = [
    const HomePage(), 
    const Product(), 
    const Pharmacy(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex:
          widget.currentIndex, 
      onTap: (index) {
        widget.onTap(
            index); 
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  _screens[index]),
        );
      },
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services),
          label: 'Medicamentos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital),
          label: 'Farmácias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
