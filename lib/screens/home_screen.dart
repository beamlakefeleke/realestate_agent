import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> properties = [
    {
      'name': 'Cozy Apartment',
      'location': 'New York',
      'price': '\$2,500',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Spacious Villa',
      'location': 'Los Angeles',
      'price': '\$10,000',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Modern House',
      'location': 'Chicago',
      'price': '\$5,000',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Spacious Villa',
      'location': 'Los Angeles',
      'price': '\$10,000',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Estate App'),
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          var property = properties[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                property['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(property['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property['location']),
                  Text(property['price']),
                ],
              ),
              onTap: () {
                
              },
            ),
          );
        },
      ),
    );
  }
}