import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Api {
  // جلب درجة الحرارة من API
  Future<double> fetchTemperature({required String city}) async {
    final String? apid = dotenv.env['API_KEY'];
    final String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apid&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // إذا كانت الاستجابة ناجحة، قم بتحليل البيانات
        final Map<String, dynamic> data = json.decode(response.body);
        double temperature = data['main']['temp'];
        return temperature;
      } else {
        throw Exception('Failed to load temperature');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
