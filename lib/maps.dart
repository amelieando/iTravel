import 'package:flutter/material.dart';
import 'main.dart';
import 'search_page.dart';
import 'menu.dart';

class MyMapsPage extends StatefulWidget {
  const MyMapsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyMapsPage> createState() => _MyMapsPageState();
}

class _MyMapsPageState extends State<MyMapsPage> {
  int _selectedIndex = 3; // Start with 'Map' selected

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home')),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MySearchPage(title: 'Search Page')),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyMenuPage(title: 'Menu')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Phuket Thailand',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Map", style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildBottomNavigationBarItem(Icons.home, 'Home'),
          _buildBottomNavigationBarItem(Icons.search, 'Search'),
          _buildBottomNavigationBarItem(Icons.menu, 'Menu'),
          _buildBottomNavigationBarItem(Icons.map, 'Map'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedLabelStyle: const TextStyle(color: Colors.lightBlueAccent),
        showUnselectedLabels: true,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.lightBlueAccent),
      activeIcon: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(0.6),
              spreadRadius: 4,
              blurRadius: 10,
            ),
          ],
        ),
        child: Icon(icon, color: Colors.grey),
      ),
      label: label,
    );
  }
}