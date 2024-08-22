import 'package:flutter/material.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Serviços Oferecidos',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.blueAccent),
          const SizedBox(height: 10),
          Image.asset(
            'assets/servicos.png',
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          const Text(
            'A Secretaria de Promoção e Assistência Social de Bebedouro oferece diversos serviços para atender a população em situação de vulnerabilidade social, incluindo:\n\n'
            '- **CRAS (Centro de Referência de Assistência Social)**: atendimento e acompanhamento familiar, atividades socioeducativas, programas de transferência de renda, entre outros.\n'
            '- **CREAS (Centro de Referência Especializado de Assistência Social)**: atendimento a famílias e indivíduos em situação de risco pessoal e social, com violação de direitos.\n'
            '- **Programa Bolsa Família**: gestão e acompanhamento do Programa Bolsa Família, garantindo o acesso das famílias aos benefícios sociais.\n'
            '- **Serviço de Convivência e Fortalecimento de Vínculos**: atividades para crianças, adolescentes e idosos com o objetivo de fortalecer os vínculos familiares e comunitários.\n'
            'A secretaria desenvolve ações que visam garantir a proteção social básica e especial, atendendo crianças, adolescentes, idosos, pessoas com deficiência e famílias em situação de risco.',
            style: TextStyle(fontSize: 18, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
