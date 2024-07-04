import 'package:flutter/material.dart';
import 'menu.dart';
import 'main.dart';
import 'maps.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  int _selectedIndex = 1; // Start with 'Search' selected
  final TextEditingController _searchController = TextEditingController(); // Define _searchController here

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
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyMenuPage(title: 'Menu')),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyMapsPage(title: 'Maps')),
        );
        break;
    }
  }

  void _navigateToMenuPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyMenuPage(title: 'Menu')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Search for a destination',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController, // Assign _searchController to TextField
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (query) {
                setState(() {
                  // Handle search logic here
                });
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                if (_selectedIndex == 1 && _searchController.text.toLowerCase().contains("phu"))
                  ListTile(
                    title: const Text("Phuket, Thailand"),
                    onTap: _navigateToMenuPage,
                  ),
              ],
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
