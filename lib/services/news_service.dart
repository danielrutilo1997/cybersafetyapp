import 'package:cybersafetyapp/models/cyber_security_event.dart';
import 'package:http/http.dart' as http;
import 'xml:xml/xml.dart' as xml;
import 'dart:io';

class NewsService {
  final String url = "https://www.bleepingcomputer.com/feed/";

  List<CyberSecurityEvent> fetchRSSFeed(String url) async {
    try {
      // 1. Make an HTTP GET request to the RSS feed URL
      final response = await http.get(Uri.parse(url));

      // 2. Check if the request was successful
      if (response.statusCode == 200) {
        // 3. Get the response body (which is XML text)
        // 4. Parse the XML
        final responseBody = xml.XmlDocument.parse(response.body);
        // 5. Extract article data from the XML
        final items = responseBody.findAllElements('items');
        // 6. Convert each article to a CyberSecurityEven object
        List<CyberSecurityEvent> events;
        for (var item in items) {
          String title = items.findAllElements('title').first.innerText;
          String description = items
              .findAllElements('description')
              .first
              .innerText;
          String url = items.findAllElements('link').first.innerText;
          DateTime pubDate = items.findAllElements('pubDate').first.innerText;

          CyberSecurityEvent event = new CyberSecurityEvent(
            title: title,
            description: description,
            url: url,
            publishedDate: pubDate,
            summary: null,
          );
        }

        // 7. Return a list of CyberSecurityEvent objects
        return events;
      }
    } on http.ClientException catch (e) {
      print('Error! $e');
    }
  }
}
