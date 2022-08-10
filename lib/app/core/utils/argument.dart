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
