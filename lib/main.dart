import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'noticia.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'pages/sobre_page.dart';
import 'pages/servicos_page.dart';
import 'pages/contato_page.dart';
import 'pages/noticia_detalhes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AS Bebedouro',
      theme: ThemeData(
        primaryColor: Colors.white,
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
          toolbarHeight: 150, // Ajuste a altura do cabeçalho conforme necessário
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/logo.png',
                    height: 60, // Ajuste a altura da logo conforme necessário
                  ),
                  const SizedBox(height: 5),
                  // Título
                  const Text(
                    'Assistência Social',
                    style: TextStyle(
                      fontSize: 20, // Ajuste o tamanho do título conforme necessário
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 27, 27, 26),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 100, // Ajuste a altura do banner conforme necessário
                  width: double.infinity,
                  child: Image.asset(
                    'assets/banner.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 27, 27, 26),
            labelColor: Color.fromARGB(255, 27, 27, 26),
            unselectedLabelColor: Colors.black54,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'HOME'),
              Tab(text: 'SOBRE'),
              Tab(text: 'SERVIÇOS'),
              Tab(text: 'CONTATOS'),
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
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '© 2024 Prefeitura Municipal de Bebedouro',
              style: TextStyle(color: Colors.black54, fontSize: 14),
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
    try {
      final response = await Dio().get('http://127.0.0.1:8000/noticias');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Noticia.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load noticias');
      }
    } catch (e) {
      throw Exception('Erro ao carregar notícias: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Noticia>>(
        future: _futureNoticias,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma notícia disponível.'));
          } else {
            final noticias = snapshot.data!;
            final imageUrls = noticias
                .where((noticia) => noticia.imageUrl != null)
                .map((noticia) => noticia.imageUrl!)
                .toList();

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Carousel de Imagens
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 1200,
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.25,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          autoPlayInterval: const Duration(seconds: 5),
                        ),
                        items: imageUrls.map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.broken_image, color: Colors.grey),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  // Seção de Notícias
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Mensagem Chamativa
                        Text(
                          'Últimas Notícias',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 27, 27, 26),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        // Linha Separadora
                        Divider(
                          color: Color.fromARGB(255, 27, 27, 26),
                          thickness: 2,
                        ),
                        const SizedBox(height: 20),
                        // Grid de Notícias
                        LayoutBuilder(
                          builder: (context, constraints) {
                            int columns = 2; // Define duas colunas como padrão para mobile
                            if (constraints.maxWidth > 1200) {
                              columns = 4;
                            } else if (constraints.maxWidth > 800) {
                              columns = 3;
                            }

                            return Center(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 1200,
                                ),
                                child: GridView.builder(
                                  padding: const EdgeInsets.all(10),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: columns,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 1.0,
                                  ),
                                  itemCount: noticias.length,
                                  itemBuilder: (context, index) {
                                    final noticia = noticias[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NoticiaDetalhesPage(noticia: noticia),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            if (noticia.imageUrl != null) 
                                              ClipRRect(
                                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                                child: Image.network(
                                                  noticia.imageUrl!,
                                                  height: 120,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error, stackTrace) => Container(
                                                    color: Colors.grey[300],
                                                    child: const Icon(Icons.broken_image, color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    noticia.name,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    noticia.description,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black54,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
