import 'package:cybersafetyapp/models/cyber_security_event.dart';
import 'package:cybersafetyapp/services/news_service.dart';
import 'package:cybersafetyapp/services/openai_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
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
    // returns Future<List<CyberSecurityEvent>>
    final articles = newsService.fetchRSSFeed(newsService.url);
    for (var article in await articles){
      
    }
  }
  @override
  void initState() {
    super.initState();
    // Initialize and fetch data when screen loads
    newsService.fetchRSSFeed()
  }

  @override
  Widget build(BuildContext context) {
    // Return your UI here (Scaffold with AppBar, body with ListView, etc.)

  }
}

