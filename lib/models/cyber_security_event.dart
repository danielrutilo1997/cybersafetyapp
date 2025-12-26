class CyberSecurityEvent {
  // Fields
  final String title;
  final String description;
  final String url;
  final DateTime publishedDate;
  final String? summary;

  // Constructor
  CyberSecurityEvent({
    required this.title,
    required this.description,
    required this.url,
    required this.publishedDate,
    this.summary,
  });

  //jason processor
  factory CyberSecurityEvent.fromJson(Map<String, dynamic> json) {
    return CyberSecurityEvent(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      publishedDate: DateTime.parse(json['publishedDate']),
      summary: json['summary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'publishedDate': publishedDate.toIso8601String(),
      'summary': summary,
    };
  }
}
