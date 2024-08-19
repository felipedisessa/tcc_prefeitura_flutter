class Noticia {
  final int id;
  final String name;
  final String description;


  Noticia({required this.id, required this.name, required this.description});

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
