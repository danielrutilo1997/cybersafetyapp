import 'package:cybersafetyapp/models/cyber_security_event.dart';
import 'package:cybersafetyapp/services/news_service.dart';
import 'package:cybersafetyapp/services/openai_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State variables
  List<CyberSecurityEvent>? events;
  bool isLoading = true;
  final NewsService newsService = NewsService();
  final OpenAIService openAIService = OpenAIService();

  Future<void> _fetchAndSummarizeArticles() async {
    try {
      print('Fetching articles...');
      // returns Future<List<CyberSecurityEvent>>
      final articles = await newsService.fetchRSSFeed(newsService.url);
      print('Fetched ${articles.length} articles!');
      final limitedArticles = articles.take(3).toList();

      for (var article in limitedArticles) {
        print('Processing: ${article.title}');
        // Skip OpenAI summarization for now (quota exceeded)
        // Use first 200 characters of description as summary
        String summary = article.description.length > 200
            ? '${article.description.substring(0, 200)}...'
            : article.description;
        // Create a new event with the summary
        CyberSecurityEvent updatedEvent = CyberSecurityEvent(
          title: article.title,
          description: article.description,
          url: article.url,
          publishedDate: article.publishedDate,
          summary: summary,
        );

        // Add it to the list
        events ??= [];
        events!.add(updatedEvent);
      }
      setState(() {
        isLoading = false;
      });
      print('Finished!');
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize and fetch data when screen loads
    _fetchAndSummarizeArticles();
  }

  @override
  Widget build(BuildContext context) {
    // Return your UI here (Scaffold with AppBar, body with ListView, etc.)
    return Scaffold(
      appBar: AppBar(
        title: Text('Cybersecurity News'),
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : events == null || events!.isEmpty
          ? Center(child: Text('No articles found'))
          : ListView.builder(
              itemCount: events!.length,
              itemBuilder: (context, index) {
                final event = events![index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          event.summary ?? 'No summary available',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          event.publishedDate.toString(),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
