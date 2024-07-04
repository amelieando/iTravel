import 'package:flutter/material.dart';
import 'main.dart';
import 'search_page.dart';
import 'menu.dart';
import 'maps.dart'; // Ensure to import your maps page here

class MyHotelPage extends StatefulWidget {
  const MyHotelPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHotelPage> createState() => _MyHotelPageState();
}

class _MyHotelPageState extends State<MyHotelPage> {
  int _selectedIndex = 0;

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
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyMapsPage(title: 'Map')),
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
              'About Phuket Thailand',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("About Page", style: TextStyle(fontSize: 24)),
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

void main() {
  runApp(const MaterialApp(
    home: MyHotelPage(title: 'Bottom Navigation Bar Demo'),
  ));
}
