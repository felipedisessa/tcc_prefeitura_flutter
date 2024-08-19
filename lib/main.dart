import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// Definição da classe Noticia com suporte a imagem
class Noticia {
  final int id;
  final String name;
  final String description;
  final String? imageUrl; // Novo campo para a URL da imagem

  Noticia({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'], // Acessa o campo da imagem
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistência Social Bebedouro',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
      routes: {
        '/sobre': (context) => const SobrePage(),
        '/servicos': (context) => const ServicosPage(),
        '/contato': (context) => const ContatoPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 40,
              ),
              const SizedBox(width: 10),
              const Text('Assistência Social Bebedouro'),
            ],
          ),
          backgroundColor: Colors.blueAccent,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.article), text: 'Notícias'),
              Tab(icon: Icon(Icons.info), text: 'Sobre'),
              Tab(icon: Icon(Icons.work), text: 'Serviços'),
              Tab(icon: Icon(Icons.contact_mail), text: 'Contato'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NoticiasPage(),
            SobrePage(),
            ServicosPage(),
            ContatoPage(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '© 2024 Assistência Social Bebedouro',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({Key? key}) : super(key: key);

  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  late Future<List<Noticia>> _futureNoticias;

  @override
  void initState() {
    super.initState();
    _futureNoticias = fetchNoticias();
  }

  Future<List<Noticia>> fetchNoticias() async {
    final response = await Dio().get('http://127.0.0.1:8000/noticias');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((json) => Noticia.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load noticias');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/banner.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
          ),
          Expanded(
            child: FutureBuilder<List<Noticia>>(
              future: _futureNoticias,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Nenhuma notícia disponível.'));
                } else {
                  final noticias = snapshot.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: noticias.length,
                    itemBuilder: (context, index) {
                      final noticia = noticias[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            noticia.imageUrl != null
                                ? Image.network(
                                    noticia.imageUrl!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 150,
                                  )
                                : Container(), // Placeholder se não houver imagem
                            const SizedBox(height: 10),
                            Text(
                              noticia.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              noticia.description,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Divider(color: Colors.blueAccent),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
            '- **CREAS (Centro de Referência Especializado de Assistência Social)**: atendimento especializado para famílias e indivíduos em situação de risco pessoal e social, por violação de direitos.\n'
            '- **Serviço de Convivência e Fortalecimento de Vínculos**: atividades para diferentes faixas etárias com o objetivo de fortalecer vínculos familiares e comunitários.\n'
            '- **Benefícios Eventuais**: auxílio para situações de vulnerabilidade temporária, como cestas básicas, auxílio funeral, entre outros.',
            style: TextStyle(fontSize: 18, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

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
