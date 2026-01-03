import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class OpenAIService {
  String? apiKey;
  static const String apiUrl = 'https://api.openai.com/v1/chat/completions';
  Future<String> loadAPIKey() async {
    try {
      // 1. We're reading the file from keys.json
      final file = File('keys.json');
      final contents = await file.readAsString();

      // 2. Parse JSON
      final json = jsonDecode(contents);

      // 3. Extract API key
      apiKey = json['OPEN_AI_API_KEY'];

      return apiKey;
    } catch (e) {
      print('Error loading API key: $e');
      throw Exception('Failed to load API key');
    }
  }

  Future<String> summarizeArticle(String articleText) {
    return [];
  }
}
