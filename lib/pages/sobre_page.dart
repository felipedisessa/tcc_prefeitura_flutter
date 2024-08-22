import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sobre a Assistência Social de Bebedouro',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.blueAccent),
          const SizedBox(height: 10),
          Image.asset(
            'assets/sobre.png',
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          const Text(
            'A Secretaria Municipal de Promoção e Assistência Social de Bebedouro é responsável pela gestão da política de assistência social no município, '
            'atuando na promoção de serviços, programas, projetos e benefícios voltados para a melhoria da qualidade de vida das pessoas em situação de vulnerabilidade social. '
            'A secretaria desenvolve ações que visam garantir a proteção social básica e especial, atendendo crianças, adolescentes, idosos, pessoas com deficiência e famílias em situação de risco.',
            style: TextStyle(fontSize: 18, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
