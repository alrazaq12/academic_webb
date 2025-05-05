import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchAcademicData() async {
  final response = await http.get(
    Uri.parse('http://localhost:3001/api/academic'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body); // Mengambil data dalam format JSON
  } else {
    throw Exception('Failed to load academic data');
  }
}
