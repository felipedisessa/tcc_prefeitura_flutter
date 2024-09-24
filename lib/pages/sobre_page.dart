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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagem de cabeçalho
                Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/sobre.png'), // Substitua pela imagem desejada
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(
                        'Assistência Social de Bebedouro',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Conteúdo principal
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título da seção
                      const Text(
                        'Sobre Nós',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        'Funções Essenciais do Órgão Gestor',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Gestão do Sistema Municipal de Assistência Social'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Coordenação da Proteção Social Básica'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Coordenação da Proteção Social Especial'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Planejamento e Orçamento'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Gerenciamento do Fundo Municipal de Assistência Social'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Gerenciamento dos Sistemas de Informação'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Monitoramento e Controle da Execução dos Serviços'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Controle da Rede Socioassistencial'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Gestão do Trabalho'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Apoio às Instâncias de Deliberação'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline, color: primaryColor),
                            title: Text('Vigilância Socioassistencial'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Contato
                      const Text(
                        'Contato',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.location_on, color: primaryColor),
                                title: Text('Avenida Oswaldo Perrone, nº 489, Jardim Progresso'),
                              ),
                              ListTile(
                                leading: Icon(Icons.phone, color: primaryColor),
                                title: Text('(17) 3342-1202 / 3342-1252'),
                              ),
                              ListTile(
                                leading: Icon(Icons.access_time, color: primaryColor),
                                title: Text('Segunda a sexta-feira, das 8h às 17h'),
                              ),
                              ListTile(
                                leading: Icon(Icons.email, color: primaryColor),
                                title: Text('promocaosocial@bebedouro.sp.gov.br'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Ícones de Redes Sociais
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.facebook),
                              color: Colors.blueAccent,
                              iconSize: 40,
                              onPressed: _launchFacebook,
                            ),
                            // Adicione outros ícones de redes sociais aqui, se desejar
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
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
