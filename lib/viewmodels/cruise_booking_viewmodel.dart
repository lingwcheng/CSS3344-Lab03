// lib/viewmodels/cruise_booking_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = CruiseDestination(
    title: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description: 'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and waterfront settlements.',
  );

  DateTime? selectedDate;
  String selectedPackage = 'Express Boat';
  bool isDarkMode = false;
  bool isFavorited = false;

  final List<String> packageOptions = [
    'Express Boat',
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise'
  ];

  void toggleFavorite() {
    isFavorited = !isFavorited;
    if (isFavorited) {
      destination.starCount++;
    } else {
      destination.starCount--;
    }
    notifyListeners();
  }

  void updateDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void updatePackage(String package) {
    selectedPackage = package;
    notifyListeners();
  }

  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}