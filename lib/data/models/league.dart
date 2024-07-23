class League {
  final int id;
  final String name;

  League({required this.id, required this.name});

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['id'],
      name: json['name'],
    );
  }
}
