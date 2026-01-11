import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class OpenAIService {
  String? apiKey;
  static const String apiUrl = 'https://api.openai.com/v1/chat/completions';
  // This function retrieves our API key for OpenAI
  Future<String> loadAPIKey() async {
    try {
      // 1. We're reading the file from keys.json
      final file = File('keys.json');
      final contents = await file.readAsString();

      // 2. Parse JSON
      final json = jsonDecode(contents);

      // 3. Extract API key
      apiKey = json['OPEN_AI_API_KEY'];

      return apiKey!;
    } catch (e) {
      print('Error loading API key: $e');
      throw Exception('Failed to load API key');
    }
  }

  // We'll use this function to summarize our articles
  Future<String> summarizeArticle(String articleText) async {
    try {
      if (apiKey == null) {
        await loadAPIKey();
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a helpful assistant that summarizes cybersecurity news articles.',
            },
            {
              'role': 'user',
              'content':
                  'Please summarize this article in 2-3 sentences: $articleText',
            },
          ],
          'temperature': 0.7,
          'max_tokens': 150,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final summary = responseData['choices'][0]['message']['content'];
        return summary;
      } else {
        throw Exception('Failed to summarize: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to summarize article');
    }
  }
}
