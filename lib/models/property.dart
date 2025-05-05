class Property {
  final String id;
  final String title;
  final String description;
  final double price;
  final String type;
  final String location;
  final List<String> amenities;
  final String status;
  final List<String> images;
  final String agentId;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.type,
    required this.location,
    required this.amenities,
    required this.status,
    required this.images,
    required this.agentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'type': type,
      'location': location,
      'amenities': amenities,
      'status': status,
      'images': images,
      'agentId': agentId,
    };
  }

  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      type: map['type'] ?? '',
      location: map['location'] ?? '',
      amenities: List<String>.from(map['amenities'] ?? []),
      status: map['status'] ?? '',
      images: List<String>.from(map['images'] ?? []),
      agentId: map['agentId'] ?? '',
    );
  }
}