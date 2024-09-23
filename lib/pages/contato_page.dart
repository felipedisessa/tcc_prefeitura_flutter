import 'package:flutter/material.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({Key? key}) : super(key: key);

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
                  'Entre em Contato Conosco',
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
                      'assets/contato.png',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
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
                ),
                const SizedBox(height: 20),
                // Contato DMPAS
                const Text(
                  'Departamento Municipal de Promoção e Assistência Social (DMPAS)',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '**Endereço:** Avenida Oswaldo Perrone, nº 489, Jardim Progresso\n\n'
                  '**Telefones:** (17) 3342-1202 / 3342-1252\n\n'
                  '**Horário de atendimento:**\n'
                  'DMPAS: de segunda à sexta-feira das 8h às 17h\n'
                  'CRAS/CREAS/CRAM/Centro Dia: de segunda à sexta-feira das 8h às 17h\n\n'
                  '**E-mail:** promocaosocial@bebedouro.sp.gov.br',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
                // Outros Contatos (se necessário, você pode adicionar mais informações aqui)
                // Exemplo:
                /*
                const Text(
                  'Outros Contatos',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                // Adicione outros contatos aqui
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
