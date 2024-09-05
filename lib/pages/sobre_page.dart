import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

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
                  Icon(Icons.info_outline, size: 32, color: Colors.black87),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Sobre a Assistência Social de Bebedouro',
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
                'assets/sobre.png',
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
                'A Secretaria Municipal de Promoção e Assistência Social de Bebedouro é responsável pela gestão da política de assistência social no município, '
                'atuando na promoção de serviços, programas, projetos e benefícios voltados para a melhoria da qualidade de vida das pessoas em situação de vulnerabilidade social. '
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
