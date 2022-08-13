import 'package:bookingdive/app/data/model/index.dart';

class SearchFilterMockData {
  ResponseSearchFilter successResponse =
      ResponseSearchFilter.fromJson(jsonResponse);

  static const jsonResponse = {
    "message": "message",
    "error": null,
    "data": [
      {
        "group": "Inclusion",
        "type": "Multiple",
        "filterBy": [
          {"key": "3", "label": "Certification"},
          {"key": "4", "label": "Equipment rental set"},
          {"key": "5", "label": "Nitrox per dive"},
          {"key": "6", "label": "Regulator"},
          {"key": "7", "label": "Training materials"},
          {"key": "8", "label": "Weights/Weight belt"}
        ]
      },
      {
        "group": "Exclusion",
        "type": "Multiple",
        "filterBy": [
          {"key": "9", "label": "Dive computer"},
          {"key": "10", "label": "Marine park fees"},
          {"key": "11", "label": "National pak fees"},
        ]
      }
    ]
  };
}
