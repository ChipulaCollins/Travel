class ServiceRequest {
  String clientName;
  String description;
  DateTime dateTime;
  String location;
  String status; // e.g., 'Pending', 'In Progress', 'Completed'
  List<String> images; // URLs or paths to images

  ServiceRequest({
    required this.clientName,
    required this.description,
    required this.dateTime,
    required this.location,
    this.status = 'Pending',
    this.images = const [],
  });
}
