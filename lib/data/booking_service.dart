import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:my_thai_star_flutter/data/dummy_data.dart';
import 'package:my_thai_star_flutter/models/booking.dart';
import 'package:my_thai_star_flutter/models/generated/booking_request.dart';
import 'package:my_thai_star_flutter/models/generated/booking_response.dart';
import 'package:my_thai_star_flutter/repositories/exchange_point.dart';
import 'package:http/http.dart' as http;

class BookingService extends ExchangePoint<Booking, String> {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  static const String endPoint =
      'http://10.0.2.2:8082/mythaistar/services/rest/bookingmanagement/v1/booking';

  @override
  Future<String> post(Booking input) async {
    input.date = formatDate(input.date);

    BookingRequest requestBody = BookingRequest.fromBooking(input);
    http.Response response;

    try {
      response = await http.post(
        endPoint,
        headers: requestHeaders,
        body: jsonEncode(requestBody.toJson()),
      );
    } catch (e) {
      return DummyData.bookingNumber;
    }

    Map<dynamic, dynamic> respJson = json.decode(response.body);
    BookingResponse bookingResponse = BookingResponse.fromJson(respJson);

    return bookingResponse.bookingToken;
  }

  String formatDate(String original) {
    DateFormat newFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'");
    
    DateTime date = Booking.dateFormat.parse(original);
    return newFormat.format(date);
  }
}
