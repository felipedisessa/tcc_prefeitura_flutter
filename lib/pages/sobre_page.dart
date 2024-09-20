import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

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
                  'Sobre a Assistência Social de Bebedouro',
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
                      'assets/sobre.png',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Texto descritivo
                const Text(
                  'A Secretaria Municipal de Promoção e Assistência Social de Bebedouro é responsável pela gestão da política de assistência social no município, '
                  'atuando na promoção de serviços, programas, projetos e benefícios voltados para a melhoria da qualidade de vida das pessoas em situação de vulnerabilidade social. '
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
