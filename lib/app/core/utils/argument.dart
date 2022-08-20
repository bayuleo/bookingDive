import 'package:bookingdive/app/data/model/index.dart';

enum SearchBy { country, city }

class SearchArguments {
  final ResponseCitiesListCountries selectedDestination;
  final String date;
  final String diver;
  final SearchBy searchBy;

  SearchArguments({
    required this.selectedDestination,
    required this.date,
    required this.diver,
    required this.searchBy,
  });
}

class LocationArguments {
  final String locationName;
  final String date;
  final String diver;
  final String id;

  LocationArguments({
    required this.locationName,
    required this.date,
    required this.diver,
    required this.id,
  });
}

class ReviewArguments {
  final String locationName;
  final int rating;
  final int totalReview;
  final String id;

  ReviewArguments({
    required this.locationName,
    required this.rating,
    required this.totalReview,
    required this.id,
  });
}

class OrderArguments {
  final String locationName;
  final String packageName;
  final String duration;
  final int dives;
  final int divers;

  OrderArguments({
    required this.locationName,
    required this.packageName,
    required this.duration,
    required this.dives,
    required this.divers,
  });
}
