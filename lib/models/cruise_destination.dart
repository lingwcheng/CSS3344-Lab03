// lib/models/cruise_destination.dart
class CruiseDestination {
  final String title;
  final String location;
  final String description;
  int starCount;

  CruiseDestination({
    required this.title,
    required this.location,
    required this.description,
    this.starCount = 41,
  });
}