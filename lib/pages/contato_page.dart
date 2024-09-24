import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({Key? key}) : super(key: key);

  static const double maxContentWidth = 1200.0; // Largura máxima para o conteúdo
  static const Color primaryColor = Color(0xFF1B1B1A); // Cor primária

  // Função para lançar URLs (telefone, e-mail ou mapas)
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Não foi possível abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo do Scaffold
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            padding: const EdgeInsets.all(16.0), // Adicionado padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título da página
                const Text(
                  'Entre em Contato Conosco',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                // Divider
                const Divider(
                  color: primaryColor,
                  thickness: 2,
                  height: 0,
                ),
                const SizedBox(height: 20),
                // Texto descritivo
                const Text(
                  'Se você precisa de mais informações sobre os serviços da Secretaria Municipal de Promoção e Assistência Social de Bebedouro, entre em contato conosco pelos canais abaixo:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                // Card de Contato
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Departamento Municipal de Promoção e Assistência Social (DMPAS)',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildInfoRow(Icons.location_on, 'Avenida Oswaldo Perrone, nº 489, Jardim Progresso'),
                        GestureDetector(
                          onTap: () => _launchURL('tel:1733421202'),
                          child: _buildInfoRow(Icons.phone, '(17) 3342-1202 / 3342-1252', isLink: true),
                        ),
                        _buildInfoRow(Icons.access_time, 'Segunda a sexta-feira, das 8h às 17h'),
                        GestureDetector(
                          onTap: () => _launchURL('mailto:promocaosocial@bebedouro.sp.gov.br'),
                          child: _buildInfoRow(Icons.email, 'promocaosocial@bebedouro.sp.gov.br', isLink: true),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Ícones de Redes Sociais
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Ícone do Facebook
                      IconButton(
                        icon: const Icon(Icons.facebook),
                        color: Colors.blueAccent,
                        iconSize: 40,
                        onPressed: () => _launchURL('https://www.facebook.com/dmpasbebedouro/'),
                      ),
                      // Você pode adicionar outros ícones de redes sociais aqui
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método auxiliar para construir linhas de informação com ícones
  Widget _buildInfoRow(IconData icon, String text, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: isLink ? Colors.blueAccent : Colors.black87,
                decoration: isLink ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
