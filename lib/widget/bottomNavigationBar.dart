import 'package:flutter/material.dart';
import 'package:mobile_project/widget/Birthday.dart';
import 'package:mobile_project/pages/Homepage.dart';
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
      onTap: (index) {
        if (index == 0) {
          // When Home is tapped, navigate to the homepage where all products are displayed
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Homepage()),
          );
        } else if (index == 1) {
          // If Category is tapped, navigate to the category page (you can replace with actual category page)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => BirthdayCalculator()), // Replace with your category page
          );
        } else {
          onItemTapped(index); // For other items, handle the usual onItemTapped logic
        }
      },
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withOpacity(0.6),
      selectedLabelStyle: const TextStyle(color: Colors.black),
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Go to Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Me',
        ),
      ],
    );
  }
}
