import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  static const double maxContentWidth = 1200.0; // Largura máxima para o conteúdo
  static const Color primaryColor = Color.fromARGB(255, 27, 27, 26);

  // URL do Facebook
  final String facebookUrl = 'https://www.facebook.com/dmpasbebedouro/';

  // Função para lançar o URL
  Future<void> _launchFacebook() async {
    final Uri url = Uri.parse(facebookUrl);
    if (!await launchUrl(url)) {
      throw 'Não foi possível abrir o link $facebookUrl';
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título da página
                const Text(
                  'Assistência Social de Bebedouro',
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
                  'A Política Pública de Assistência Social é um direito do cidadão e dever do Estado, organizada de forma descentralizada e participativa, visando prover proteção à vida, reduzir danos e prevenir riscos sociais. O Departamento Municipal de Promoção e Assistência Social (DMPAS) é o órgão responsável pela gestão dessa política em Bebedouro/SP, atuando na promoção de serviços, programas, projetos e benefícios para melhorar a qualidade de vida das pessoas em situação de vulnerabilidade social.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                // Lista de Funções Essenciais
                const Text(
                  'Funções Essenciais do Órgão Gestor:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. Gestão do Sistema Municipal de Assistência Social\n'
                  '2. Coordenação da Proteção Social Básica\n'
                  '3. Coordenação da Proteção Social Especial\n'
                  '4. Planejamento e Orçamento\n'
                  '5. Gerenciamento do Fundo Municipal de Assistência Social\n'
                  '6. Gerenciamento dos Sistemas de Informação\n'
                  '7. Monitoramento e Controle da Execução dos Serviços\n'
                  '8. Controle da Rede Socioassistencial\n'
                  '9. Gestão do Trabalho\n'
                  '10. Apoio às Instâncias de Deliberação\n'
                  '11. Vigilância Socioassistencial',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                // Contato
                const Text(
                  'Contato:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Endereço: Avenida Oswaldo Perrone, nº 489, Jardim Progresso\n'
                  'Telefones: (17) 3342-1202 / 3342-1252\n'
                  'Horário de Atendimento: Segunda a sexta-feira, das 8h às 17h\n'
                  'E-mail: promocaosocial@bebedouro.sp.gov.br',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
                // Ícone do Facebook
                Center(
                  child: IconButton(
                    icon: const Icon(Icons.facebook),
                    color: Colors.blueAccent,
                    iconSize: 50,
                    onPressed: _launchFacebook,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
