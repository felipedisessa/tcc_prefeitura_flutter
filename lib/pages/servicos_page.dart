import 'package:flutter/material.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.handshake, size: 32, color: Colors.white),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Serviços Oferecidos',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                'assets/servicos.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            
            // Texto descritivo com estilo melhorado
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'A Secretaria de Promoção e Assistência Social de Bebedouro oferece diversos serviços para atender a população em situação de vulnerabilidade social, incluindo:\n\n'
                '- **CRAS (Centro de Referência de Assistência Social)**: atendimento e acompanhamento familiar, atividades socioeducativas, programas de transferência de renda, entre outros.\n\n'
                '- **CREAS (Centro de Referência Especializado de Assistência Social)**: atendimento a famílias e indivíduos em situação de risco pessoal e social, com violação de direitos.\n\n'
                '- **Programa Bolsa Família**: gestão e acompanhamento do Programa Bolsa Família, garantindo o acesso das famílias aos benefícios sociais.\n\n'
                '- **Serviço de Convivência e Fortalecimento de Vínculos**: atividades para crianças, adolescentes e idosos com o objetivo de fortalecer os vínculos familiares e comunitários.\n\n'
                'A secretaria desenvolve ações que visam garantir a proteção social básica e especial, atendendo crianças, adolescentes, idosos, pessoas com deficiência e famílias em situação de risco.',
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
