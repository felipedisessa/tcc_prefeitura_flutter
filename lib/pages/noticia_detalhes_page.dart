import 'package:flutter/material.dart';
import 'package:social_assistance/noticia.dart';

class NoticiaDetalhesPage extends StatelessWidget {
  final Noticia noticia;

  const NoticiaDetalhesPage({Key? key, required this.noticia}) : super(key: key);

  static const double maxContentWidth = 1200.0; // Largura máxima para o conteúdo
  static const Color primaryColor = Color.fromARGB(255, 27, 27, 26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo do Scaffold
      appBar: AppBar(
        backgroundColor: Colors.white, // Consistência de cor com o resto do projeto
        elevation: 0, // Remove a sombra sob o AppBar
        title: Text(
          noticia.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor), // Define a cor do ícone de volta
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxContentWidth), // Centraliza e define largura máxima
            padding: const EdgeInsets.all(16.0), // Espaçamento consistente
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
