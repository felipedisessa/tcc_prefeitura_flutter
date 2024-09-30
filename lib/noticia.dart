class Noticia {
  final int id;
  final String name;
  final String description;
  final String? imageUrl;
  final DateTime? createdAt; 

  Noticia({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    this.createdAt,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }
}
