
import 'package:flutter/material.dart';
import 'package:social_assistance/noticia.dart';

class NoticiaDetalhesPage extends StatelessWidget {
  final Noticia noticia;

  const NoticiaDetalhesPage({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.name),
      ),
      body: SingleChildScrollView( // Adicionado para evitar problemas de overflow
       child: Padding(
  padding: const EdgeInsets.all(16.0), // Aumentado para mais espaço ao redor
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      noticia.imageUrl != null
          ? Image.network(
              noticia.imageUrl!,
              fit: BoxFit.contain,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
            )
          : Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.grey[300],
              child: const Icon(
                Icons.image,
                color: Colors.grey,
                size: 100,
              ),
            ),
      const SizedBox(height: 16),
      Text(
        noticia.name,
        style: const TextStyle(
          fontSize: 24, 
          fontWeight: FontWeight.bold,
          color: Colors.black, // Ajuste de cor para contraste
        ),
      ),
      const SizedBox(height: 8),
      Text(
        noticia.description,
        style: const TextStyle(fontSize: 16, color: Colors.black54),
      ),
    ],
  ),
),

      ),
    );
  }
}
