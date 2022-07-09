import 'package:bookingdive/app/data/model/index.dart';

class SpotMockData {
  ResponseSpot successResponse = ResponseSpot.fromJson(jsonResponse);

  static const jsonResponse = {
    "message": "Login Sucessfully",
    "error": null,
    "data": [
      {
        "country": "Indonesia",
        "cities": [
          {"id": "1", "city": "Jakarta"},
          {"id": "2", "city": "Semarang"},
          {"id": "3", "city": "Surabaya"}
        ]
      },
      {
        "country": "Singapore",
        "cities": [
          {"id": "4", "city": "Center"},
          {"id": "5", "city": "North"}
        ]
      }
    ]
  };
}
