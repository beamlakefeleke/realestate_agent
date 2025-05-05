import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/property.dart';

class PropertyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProperty(Property property) async {
    await _firestore.collection('properties').add(property.toJson());
  }

  Future<void> editProperty(Property property) async {
    await _firestore
        .collection('properties')
        .doc(property.id)
        .update(property.toJson());
  }

  Future<void> deleteProperty(String propertyId) async {
    await _firestore.collection('properties').doc(propertyId).delete();
  }

  Stream<List<Property>> getProperties() {
    return _firestore.collection('properties').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Property.fromJson(doc.data() as Map<String, dynamic>)..id = doc.id).toList();
    });
  }

  Future<Property?> getPropertyById(String propertyId) async {
    try{
      DocumentSnapshot doc = await _firestore.collection('properties').doc(propertyId).get();
      if (doc.exists){
        return Property.fromJson(doc.data() as Map<String, dynamic>)..id = doc.id;
      }
      return null;
    } catch (e) {
      print('Error getting property by ID: $e');
      return null;
    }
  }
}