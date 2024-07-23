class Player {
  final int id;
  final String name;

  Player({required this.id, required this.name});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
    );
  }
}
