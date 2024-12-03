import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(color: Colors.black),
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.black),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          label: 'Go to Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.black),
          label: 'Me',
        ),
      ],
    );
  }
}
