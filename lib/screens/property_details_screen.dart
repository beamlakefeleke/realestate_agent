import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyDetailScreen extends StatefulWidget {
  final Map<String, dynamic> property;

  const PropertyDetailScreen({Key? key, required this.property})
      : super(key: key);

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  late GoogleMapController mapController;
  final Set<Marker> markers = new Set();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final property = widget.property;
    final lat = property['latitude'] ?? 0.0;
    final long = property['longitude'] ?? 0.0;
    markers.add(Marker(
        markerId: MarkerId(property['id']),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(
          title: property['name'],
          snippet: property['address'],
        )));
    return Scaffold(
      appBar: AppBar(
        title: Text(property['name'] ?? 'Property Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: property['images']?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      property['images'][index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property['name'] ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    property['address'] ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '\$${property['price'] ?? 0}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDetailItem(
                          '${property['bedrooms'] ?? 0} Bedrooms',
                          Icons.hotel),
                      _buildDetailItem(
                          '${property['bathrooms'] ?? 0} Bathrooms',
                          Icons.bathtub),
                      _buildDetailItem(
                          '${property['area'] ?? 0} sq ft',
                          Icons.zoom_out_map),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(property['description'] ?? ''),
                  SizedBox(height: 16),
                  Text(
                    'Amenities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: (property['amenities'] as List<dynamic>? ?? [])
                        .map((amenity) => Chip(label: Text(amenity)))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(lat, long),
                        zoom: 15.0,
                      ),
                      markers: markers,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String text, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        SizedBox(height: 4),
        Text(text),
      ],
    );
  }
}