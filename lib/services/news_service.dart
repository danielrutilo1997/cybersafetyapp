import 'package:cybersafetyapp/models/cyber_security_event.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class NewsService {
  final String url = "https://www.bleepingcomputer.com/feed/";

  Future<List<CyberSecurityEvent>> fetchRSSFeed(String url) async {
    try {
      // 1. Make an HTTP GET request to the RSS feed URL
      final response = await http.get(Uri.parse(url));

      // 2. Check if the request was successful
      if (response.statusCode == 200) {
        // 3. Get the response body (which is XML text)
        // 4. Parse the XML
        final responseBody = xml.XmlDocument.parse(response.body);
        // 5. Extract article data from the XML
        final items = responseBody.findAllElements('item');
        // 6. Convert each article to a CyberSecurityEven object
        List<CyberSecurityEvent> events = [];
        for (var item in items) {
          String title = item.findAllElements('title').first.innerText;
          String description = item
              .findAllElements('description')
              .first
              .innerText;
          String url = item.findAllElements('link').first.innerText;

          String sDate = item.findAllElements('pubDate').first.innerText;
          DateTime pubDate;
          try {
            pubDate = DateTime.parse(sDate);
          } catch (e) {
            // Do current time as fallback in case parsing fails
            pubDate = DateTime.now();
            print('Failed to parse date: $sDate');
          }

          CyberSecurityEvent event = CyberSecurityEvent(
            title: title,
            description: description,
            url: url,
            publishedDate: pubDate,
            summary: null,
          );

          events.add(event);
        }

        // 7. Return a list of CyberSecurityEvent objects
        return events;
      }
      return [];
    } on http.ClientException catch (e) {
      print('Error! $e');
      return [];
    }
  }
}
