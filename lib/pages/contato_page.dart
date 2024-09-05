import 'package:flutter/material.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho da página
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.contact_mail, size: 32, color: Colors.black87),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Entre em Contato Conosco',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Imagem destacada
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/contato.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.contain, // Ajusta o fit para cobrir o espaço da imagem
              ),
            ),
            const SizedBox(height: 20),

            // Texto descritivo
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Se você precisa de mais informações sobre os serviços da Secretaria Municipal de Promoção e Assistência Social de Bebedouro, entre em contato conosco pelos canais abaixo:\n\n'
                '**Endereço**: Av. Pedro Cavalini, 1403, Centro - Bebedouro/SP\n\n'
                '**Telefone**: (17) 3343-3300\n\n'
                '**E-mail**: assistenciasocial@bebedouro.sp.gov.br',
                style: TextStyle(fontSize: 18, color: Colors.black87, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
