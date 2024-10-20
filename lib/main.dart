import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'noticia.dart';
import 'pages/sobre_page.dart';
import 'pages/servicos_page.dart';
import 'pages/contato_page.dart';
import 'pages/noticia_detalhes_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import para o indicador de páginas
import 'dart:async'; // Import para o Timer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const double maxContentWidth = 1200.0; // Largura máxima para o conteúdo

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AS Bebedouro',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Cor de fundo padrão do Scaffold
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        useMaterial3: true, // Habilita o Material 3
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

  static const double maxContentWidth = 1200.0; // Largura máxima para o conteúdo

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white, // Cor de fundo do Scaffold
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: Colors.white,
          elevation: 0, // Remove a sombra sob o AppBar
          title: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: maxContentWidth),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 800;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isWideScreen) ...[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/logo.png',
                              height: 80,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Assistência Social',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 27, 27, 26),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                      ] else ...[
                        Image.asset(
                          'assets/logo.png',
                          height: 40,
                        ),
                      ],
                      Expanded(
                        child: SizedBox(
                          height: 120,
                          child: Image.asset(
                            'assets/banner.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 2), // Adicionado 2 para a altura do Divider
            child: Column(
              children: [
                Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: maxContentWidth),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent, // Remove o efeito de splash
                        highlightColor: Colors.transparent, // Remove o efeito de highlight
                      ),
                      child: const TabBar(
                        indicatorColor: Color.fromARGB(255, 27, 27, 26),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Color.fromARGB(255, 0, 0, 0), // Cor do texto e ícone quando selecionado
                        unselectedLabelColor: Color.fromARGB(137, 29, 29, 29), // Cor do texto e ícone quando não selecionado
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        tabs: [
                          Tab(
                            icon: Icon(Icons.home, size: 20),
                            text: 'HOME',
                          ),
                          Tab(
                            icon: Icon(Icons.info, size: 20),
                            text: 'SOBRE',
                          ),
                          Tab(
                            icon: Icon(Icons.handshake, size: 20),
                            text: 'SERVIÇOS',
                          ),
                          Tab(
                            icon: Icon(Icons.contact_mail, size: 20),
                            text: 'CONTATOS',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 27, 27, 26),
                  thickness: 2,
                  height: 0,
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            ),
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
        bottomNavigationBar: const BottomAppBar(
          color: Color.fromARGB(255, 0, 0, 0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Copyright © 2024 Prefeitura Municipal de Bebedouro. Todos os direitos reservados.',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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

  static const double maxContentWidth = 1200.0; // Largura máxima para o conteúdo

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Noticia> _allNoticias = [];
  List<Noticia> _filteredNoticias = [];
  List<Noticia> _slideNoticias = []; // Lista para os slides
  final PageController _pageController = PageController(); // Controlador para o PageView
  Timer? _timer; // Timer para o auto-scroll

  @override
  void initState() {
    super.initState();
    _futureNoticias = fetchNoticias();
    _searchController.addListener(_onSearchChanged);
    _startAutoScroll(); // Inicia o auto-scroll
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _pageController.dispose(); // Dispose do controlador
    _timer?.cancel(); // Cancela o timer
    super.dispose();
  }

  // Método para iniciar o auto-scroll
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageController.hasClients && _slideNoticias.isNotEmpty) {
        int nextPage = _pageController.page!.round() + 1;
        if (nextPage >= _slideNoticias.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

 Future<List<Noticia>> fetchNoticias() async {
  try {
    final response = await Dio().get('http://127.0.0.1:8000/noticias');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      
      // Mapeia os dados para objetos Noticia
      _allNoticias = data.map((json) => Noticia.fromJson(json)).toList();

      // Ordena as notícias pelo campo 'created_at' para exibir as mais recentes primeiro
    _allNoticias.sort((a, b) {
  // Verifica se 'createdAt' de 'a' ou 'b' são nulos
    if (a.createdAt == null && b.createdAt == null) return 0;
    if (a.createdAt == null) return 1; // Notícia 'a' sem data vai para o final
    if (b.createdAt == null) return -1; // Notícia 'b' sem data vai para o final

  // Se nenhum for nulo, compara os dois DateTime normalmente
  return b.createdAt!.compareTo(a.createdAt!);
});

      _filteredNoticias = _allNoticias;

      // Inicializa _slideNoticias com todas as notícias que têm imagem
      _slideNoticias = _allNoticias.where((noticia) => noticia.imageUrl != null).toList();

      return _allNoticias;
    } else {
      throw Exception('Failed to load noticias');
    }
  } catch (e) {
    throw Exception('Erro ao carregar notícias: $e');
  }
}


  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      _filteredNoticias = _allNoticias.where((noticia) {
        return noticia.name.toLowerCase().contains(_searchQuery) ||
            noticia.description.toLowerCase().contains(_searchQuery);
      }).toList();
      // Não alteramos _slideNoticias; o carrossel permanece o mesmo
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo do Scaffold
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Barra de Pesquisa
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: maxContentWidth),
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                              hintText: 'Pesquisar notícias...',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 27, 27, 26)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Carrossel de Imagens
                  if (_slideNoticias.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                      child: Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: maxContentWidth),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.3,
                                    child: PageView.builder(
                                      controller: _pageController,
                                      itemCount: _slideNoticias.length,
                                      itemBuilder: (context, index) {
                                        final noticia = _slideNoticias[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => NoticiaDetalhesPage(noticia: noticia),
                                              ),
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              if (noticia.imageUrl != null)
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(15),
                                                  child: Image.network(
                                                    noticia.imageUrl!,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    height: MediaQuery.of(context).size.height * 0.3,
                                                    errorBuilder: (context, error, stackTrace) => Container(
                                                      color: Colors.grey[300],
                                                      child: const Icon(Icons.broken_image, color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.transparent,
                                                      Colors.black.withOpacity(0.7),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 20,
                                                left: 20,
                                                right: 20,
                                                child: Text(
                                                  noticia.name,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // Botões para passar/voltar
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                                      onPressed: () {
                                        if (_pageController.hasClients) {
                                          int prevPage = _pageController.page!.round() - 1;
                                          if (prevPage < 0) {
                                            prevPage = _slideNoticias.length - 1;
                                          }
                                          _pageController.animateToPage(
                                            prevPage,
                                            duration: const Duration(milliseconds: 500),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                                      onPressed: () {
                                        if (_pageController.hasClients) {
                                          int nextPage = _pageController.page!.round() + 1;
                                          if (nextPage >= _slideNoticias.length) {
                                            nextPage = 0;
                                          }
                                          _pageController.animateToPage(
                                            nextPage,
                                            duration: const Duration(milliseconds: 500),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: _slideNoticias.length,
                                effect: const ExpandingDotsEffect(
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  activeDotColor: Color.fromARGB(255, 27, 27, 26),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  // Seção de Notícias
                  Column(
                    children: [
                      // Mensagem Chamativa
                      
                      const SizedBox(height: 20),
                      // Divider ocupando toda a largura
                      const Divider(
                        color: Color.fromARGB(255, 27, 27, 26),
                        thickness: 2,
                        height: 0,
                        indent: 0,
                        endIndent: 0,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                      
                        child: Text(
                          'Últimas Notícias',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 27, 27, 26),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Grid de Notícias
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            int columns = 1;
                            if (constraints.maxWidth > 1200) {
                              columns = 4;
                            } else if (constraints.maxWidth > 800) {
                              columns = 3;
                            } else if (constraints.maxWidth > 600) {
                              columns = 2;
                            }

                            return Center(
                              child: Container(
                                constraints: const BoxConstraints(maxWidth: maxContentWidth),
                                child: _filteredNoticias.isNotEmpty
                                    ? GridView.builder(
                                        padding: const EdgeInsets.all(10),
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: columns,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 16,
                                          childAspectRatio: 0.8, // Ajustado para melhorar a proporção
                                        ),
                                        itemCount: _filteredNoticias.length,
                                        itemBuilder: (context, index) {
                                          final noticia = _filteredNoticias[index];
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  if (noticia.imageUrl != null)
                                                    ClipRRect(
                                                      borderRadius: const BorderRadius.only(
                                                        topLeft: Radius.circular(15),
                                                        topRight: Radius.circular(15),
                                                      ),
                                                      child: Image.network(
                                                        noticia.imageUrl!,
                                                        fit: BoxFit.cover,
                                                        width: double.infinity,
                                                        height: 150, // Ajustado para aumentar a altura da imagem
                                                        errorBuilder: (context, error, stackTrace) => Container(
                                                          color: Colors.grey[300],
                                                          child: const Icon(Icons.broken_image, color: Colors.grey),
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
                                                        color: Color.fromARGB(255, 27, 27, 26),
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                    child: Text(
                                                      noticia.description,
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : const Text(
                                        'Nenhuma notícia encontrada.',
                                        style: TextStyle(fontSize: 18),
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
