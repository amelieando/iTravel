import 'package:flutter/material.dart';
import 'search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'iTravel'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20),  // Adjust padding as needed
            child: Image.asset(
              'assets/iTravel.png',
              height: 200,  // Adjust the height as needed
              width: 200,   // Adjust the width as needed
            ),
          ),
          const SizedBox(height: 20),  // Add spacing between the image and the text
          const Text(
            'iTravel',
            style: TextStyle(
              fontSize: 32,  // Adjust the font size as needed
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),  // Add spacing between the title and the regular text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),  // Add horizontal padding for regular text
            child: Text(
              'Easiest ways and best \n places to travel to \n anywhere and everywhere! \n \n Click below to get started!',
              style: TextStyle(
                fontSize: 16,  // Adjust the font size as needed
              ),
              textAlign: TextAlign.center,  // Center the text
            ),
          ),
          const Spacer(),  // Pushes the button to the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 300),  // Adjust padding as needed
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MySearchPage(title: 'My search bar')),
                  );
                },
                child: const Text('Get Started!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
