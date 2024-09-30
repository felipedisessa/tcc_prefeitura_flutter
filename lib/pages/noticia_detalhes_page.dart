import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Certifique-se de adicionar o intl no pubspec.yaml
import 'package:social_assistance/noticia.dart';

class NoticiaDetalhesPage extends StatelessWidget {
  final Noticia noticia;

  const NoticiaDetalhesPage({Key? key, required this.noticia}) : super(key: key);

  static const double maxContentWidth = 1200.0; // Largura máxima para o conteúdo
  static const Color primaryColor = Color.fromARGB(255, 27, 27, 26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          noticia.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagem destacada
                if (noticia.imageUrl != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      noticia.imageUrl!,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image,
                      color: Colors.grey,
                      size: 100,
                    ),
                  ),
                const SizedBox(height: 20),
                // Título da notícia
                Text(
                  noticia.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                // Data de criação
                if (noticia.createdAt != null)
                  Text(
                    DateFormat('dd/MM/yyyy').format(noticia.createdAt!),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                const SizedBox(height: 10),
                // Divider
                const Divider(
                  color: primaryColor,
                  thickness: 2,
                  height: 0,
                ),
                const SizedBox(height: 20),
                // Descrição
                Text(
                  noticia.description,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
