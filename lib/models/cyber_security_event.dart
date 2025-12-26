class CyberSecurityEvent {
  final String title;
  final String description;
  final String url;
  final DateTime publishedDate;
  final String summary;

  // Constructor
  CyberSecurityEvent(
    this.title,
    this.description,
    this.url,
    this.publishedDate,
    this.summary,
  );

  //jason processor
  factory CyberSecurityEvent.fromJson(Map<String, dynamic> json) {
    //Call api '
    //Create CSEvent
    //return CSEvent
  }
}
