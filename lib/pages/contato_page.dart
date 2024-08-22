import 'package:flutter/material.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Entre em Contato Conosco',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.blueAccent),
          const SizedBox(height: 10),
          Image.asset(
            'assets/contato.png',
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          const Text(
            'Se você precisa de mais informações sobre os serviços da Secretaria Municipal de Promoção e Assistência Social de Bebedouro, entre em contato conosco pelos canais abaixo:\n\n'
            '**Endereço**: Av. Pedro Cavalini, 1403, Centro - Bebedouro/SP\n\n'
            '**Telefone**: (17) 3343-3300\n\n'
            '**E-mail**: assistenciasocial@bebedouro.sp.gov.br',
            style: TextStyle(fontSize: 18, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
