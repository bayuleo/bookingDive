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

class SearchDetailArguments {
  final String locationName;
  final String date;
  final String diver;
  final String id;

  SearchDetailArguments({
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
