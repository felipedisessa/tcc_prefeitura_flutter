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
        primaryColor:Color.fromARGB(255, 60, 57, 57),

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
      Flexible(
        child: Text(
          'AS Bebedouro',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 60, 57, 57), // Cor alterada para um vermelho
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  ),

  backgroundColor: Colors.white, // Alterado para branco
  bottom: const TabBar(
    indicatorColor:  Color.fromARGB(255, 60, 57, 57), // Cor do indicador alterada para vermelho
    tabs: [
      Tab(icon: Icon(Icons.article, color: Color.fromARGB(255, 60, 57, 57)), text: 'Notícias'),
      Tab(icon: Icon(Icons.info, color: Color.fromARGB(255, 60, 57, 57)), text: 'Sobre'),
      Tab(icon: Icon(Icons.work, color: Color.fromARGB(255, 60, 57, 57)), text: 'Serviços'),
      Tab(icon: Icon(Icons.contact_mail, color:  Color.fromARGB(255, 60, 57, 57)), text: 'Contato'),
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
          color: Color.fromARGB(255, 60, 57, 57),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '©️ 2024 AS Bebedouro',
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
      body: FutureBuilder<List<Noticia>>(
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
            final imageUrls = noticias
                .where((noticia) => noticia.imageUrl != null)
                .map((noticia) => noticia.imageUrl!)
                .toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.3,  // Reduzi para 20% da altura da tela
                      autoPlay: true,
                      enlargeCenterPage: false,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                    ),
                    items: imageUrls.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int columns = 2;
                      if (constraints.maxWidth > 1200) {
                        columns = 5;  // Aumentado para 5 colunas para telas muito largas
                      } else if (constraints.maxWidth > 800) {
                        columns = 4;  // Aumentado para 4 colunas para telas médias
                      } else if (constraints.maxWidth > 600) {
                        columns = 3;  // Aumentado para 3 colunas para telas menores
                      } else {
                        columns = 2;  // Mantido em 2 colunas para telas pequenas
                      }

                      return GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8, 
                        ),
                        itemCount: noticias.length,
                        itemBuilder: (context, index) {
                          final noticia = noticias[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NoticiaDetalhesPage(noticia: noticia),
                                ),
                              );
                            },
                           child: Card(
  elevation: 5,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15), // Borda mais arredondada
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), // Borda mais arredondada
            topRight: Radius.circular(15), // Borda mais arredondada
          ),
          child: noticia.imageUrl != null
              ? Image.network(
                  noticia.imageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                )
              : Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          noticia.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Ajuste a cor para melhor contraste
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  ),
),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
