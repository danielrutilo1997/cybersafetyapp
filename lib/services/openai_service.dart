import 'package:http/http.dart' as http;
import 'xml:xml/xml.dart' as xml;
import 'dart.io';

class NewsService {
  void fetchRSSFeed(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
    } on http.ClientException catch (e) {
      print('Error! $e');
    }
  }
}
