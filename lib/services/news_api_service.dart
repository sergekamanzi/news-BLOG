import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApiService {
  final String apiKey = '7670ec99a7664ce1aa6591c20eb74ec2';
  final String baseUrl = 'https://newsapi.org/v2';

  Future<List<dynamic>> fetchTopHeadlines() async {
    final url = Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
