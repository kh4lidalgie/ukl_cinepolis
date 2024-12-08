import 'package:flutter/material.dart';
import 'home_page.dart';
import 'movie_page.dart';
import 'cinema_page.dart';
import 'my_booking_page.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MyBookingPage(),
    MoviePage(),
    CinemaPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // menampilkan halaman yang sedang dipilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_online_outlined,
            ),
            label: 'My Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie_outlined,
            ),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.theaters_outlined,
            ),
            label: 'Cinema',
          ),
        ],
        selectedItemColor: const Color.fromRGBO(12, 26, 87, 1),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
