class Noticia {
  final int id;
  final String name;
  final String description;
  final String? imageUrl; // Novo campo para a URL da imagem

  Noticia({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'], // Acessa o campo da imagem
    );
  }
}