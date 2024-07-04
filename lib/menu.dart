import 'package:flutter/material.dart';
import 'about_page.dart';
import 'places.dart';
import 'activities.dart';
import 'attractions.dart';
import 'restaurants.dart';
import 'hidden_gems.dart';
import 'hotels.dart';
import 'landmarks.dart';
import 'search_page.dart';
import 'main.dart';
import 'maps.dart';

class MyMenuPage extends StatefulWidget {
  const MyMenuPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyMenuPage> createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MyMenuPage> {
  int _selectedIndex = 2; // Start with 'Menu' selected

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
          MaterialPageRoute(builder: (context) => const MySearchPage(title: 'Search')),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: [
                _buildMenuButton('About', Icons.info, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyAboutPage(title: 'About')),
                  );
                }),
                _buildMenuButton('Where to Go', Icons.place, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyPlacesPage(title: 'Where to go')),
                  );
                }),
                _buildMenuButton('Activities', Icons.local_activity, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyActivitiesPage(title: 'Activities')),
                  );
                }),
                _buildMenuButton('Attractions', Icons.location_city, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyAttractionsPage(title: 'Attractions')),
                  );
                }),
                _buildMenuButton('Restaurants', Icons.restaurant, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyRestaurantsPage(title: 'Restaurants')),
                  );
                }),
                _buildMenuButton('Hidden Gems', Icons.visibility, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHiddenGemsPage(title: 'Hidden Gems')),
                  );
                }),
                _buildMenuButton('Hotels', Icons.hotel, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHotelPage(title: 'Hotels')),
                  );
                }),
                _buildMenuButton('Landmarks', Icons.map, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyLandmarkPage(title: 'Landmarks')),
                  );
                }),
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

  Widget _buildMenuButton(String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
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
    home: MyMenuPage(title: 'Bottom Navigation Bar Demo'),
  ));
}
