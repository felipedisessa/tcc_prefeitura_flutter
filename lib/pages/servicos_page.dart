import 'package:flutter/material.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({Key? key}) : super(key: key);

  static const double maxContentWidth = 1200.0; // Largura máxima para o conteúdo
  static const Color primaryColor = Color.fromARGB(255, 27, 27, 26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo do Scaffold
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título da página
                const Text(
                  'Serviços Oferecidos',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Divider
                const Divider(
                  color: primaryColor,
                  thickness: 2,
                  height: 0,
                ),
                const SizedBox(height: 20),
                // Imagem destacada
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/servicos.png',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Texto descritivo
                const Text(
                  'A Secretaria de Promoção e Assistência Social de Bebedouro oferece diversos serviços para atender a população em situação de vulnerabilidade social, incluindo:\n\n'
                  '- **CRAS (Centro de Referência de Assistência Social)**: atendimento e acompanhamento familiar, atividades socioeducativas, programas de transferência de renda, entre outros.\n\n'
                  '- **CREAS (Centro de Referência Especializado de Assistência Social)**: atendimento a famílias e indivíduos em situação de risco pessoal e social, com violação de direitos.\n\n'
                  '- **Programa Bolsa Família**: gestão e acompanhamento do Programa Bolsa Família, garantindo o acesso das famílias aos benefícios sociais.\n\n'
                  '- **Serviço de Convivência e Fortalecimento de Vínculos**: atividades para crianças, adolescentes e idosos com o objetivo de fortalecer os vínculos familiares e comunitários.\n\n'
                  'A secretaria desenvolve ações que visam garantir a proteção social básica e especial, atendendo crianças, adolescentes, idosos, pessoas com deficiência e famílias em situação de risco.',
                  style: TextStyle(
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
