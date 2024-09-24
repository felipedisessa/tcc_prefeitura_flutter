import 'package:flutter/material.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({Key? key}) : super(key: key);

  static const double maxContentWidth = 1200.0; // Largura máxima para o conteúdo
  static const Color primaryColor = Color(0xFF1B1B1A); // Cor primária

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo do Scaffold
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            padding: const EdgeInsets.all(16.0), // Adicionado padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título da página
                const Text(
                  'Serviços Oferecidos',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                // Divider
                const Divider(
                  color: primaryColor,
                  thickness: 2,
                  height: 0,
                ),
                const SizedBox(height: 20),
                // Seção: Atendimento no Serviço Público
                _buildSectionTitle('Atendimento no Serviço Público'),
                const SizedBox(height: 10),
                // Lista de CRAS
                _buildServiceCard(
                  title: 'CRAS NORTE',
                  coordinator: 'Coordenador: Ricardo Gasolla',
                  address:
                      'Endereço: Avenida Prefeito Joaquim Alves Guimarães, 1610 - Vale do Sol',
                  contact: 'Contato: (17) 3342-1254',
                ),
                _buildServiceCard(
                  title: 'CRAS SUL',
                  coordinator: 'Coordenadora: Tharsila Abdalah Zanqueta',
                  address: 'Endereço: Rua Lamartini de Godoi, 601 – Jardim União',
                  contact: 'Contato: (17) 3343-2136',
                ),
                _buildServiceCard(
                  title: 'CRAS LESTE',
                  coordinator: 'Coordenadora: Vanessa Pereira da Silva',
                  address: 'Endereço: Rua Abilio França Valente, 261 - Jd. De Lucia',
                  contact: 'Contato: (17) 3343-8295',
                ),
                const SizedBox(height: 20),
                // Seção: Atendimento nas Instituições de Terceiro Setor
                _buildSectionTitle('Atendimento nas Instituições de Terceiro Setor'),
                const SizedBox(height: 10),
                // Lista de Instituições
                _buildInstitutionCard(
                  title: 'ARTSOL – Arte e Solidariedade',
                  address: 'Rua Atilio Favero, 1714 - Jardim Alvorada',
                  cnpj: 'CNPJ: 07.992.978/0001-26',
                  phone: 'Telefone: (17) 3343-8070',
                  president: 'Presidente: Manoel Cosme Coelho',
                  coordinator: 'Coordenadora: Simone Cristina de Paula Alencar Inácio',
                  email: 'Email: visimabru@yahoo.com.br',
                ),
                _buildInstitutionCard(
                  title: 'DCA – Desenvolvendo a Criança e o Adolescente',
                  address: 'Alameda Miguel Muchaque, 1214',
                  cnpj: 'CNPJ: 60.249.067/0001-96',
                  phone: 'Telefone: (17) 3343-3643',
                  president: 'Presidente: Vanda Ap. Lodo Conceição',
                  coordinator: 'Coordenadora: Maria Aparecida Chimelo dos Santos',
                  email: 'Email: dca@mdbrasil.com.br',
                ),
                _buildInstitutionCard(
                  title: 'ESA – Educandário Santo Antônio',
                  address: 'Praça Nivaldo Salvador, 95 - Vila Major Cicero de Carvalho',
                  cnpj: 'CNPJ: 51.796.621/0001-64',
                  phone: 'Telefone: (17) 3344-1520',
                  president: 'Presidente: Márcia Heloísa Iquegami',
                  coordinator: 'Coordenadora: Lislene Cunha Rissi Taraldo',
                  email: 'Email: educandario@mdbrasil.com.br',
                ),
                const SizedBox(height: 20),
                // Seção: Proteção Social Especial de Média Complexidade
                _buildSectionTitle('Proteção Social Especial de Média Complexidade'),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'A Proteção Social Especial objetiva proteger famílias e indivíduos em situação de risco, cujos direitos tenham sido violados.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 20),
                // Sub-seção: Serviços Públicos
                _buildSubSectionTitle('Serviços Públicos'),
                const SizedBox(height: 10),
                // Lista de Serviços Públicos
                _buildServiceCard(
                  title: 'CREAS – Centro de Referência Especializado de Assistência Social',
                  coordinator: 'Coordenadora: Cristiane Priscila Nascimento da Silva',
                  address: 'Endereço: Rua Visconde do Rio Branco, 521 – Centro',
                  contact: 'Contato: (17) 3345-4168',
                ),
                _buildServiceCard(
                  title: 'Centro Dia do Idoso',
                  coordinator: 'Coordenadora: Cleliane Ravagnani',
                  address: 'Endereço: Alameda Sabará, 720 – Jd do Bosque',
                  contact: 'Contato: (17) 3342-3813',
                ),
                _buildServiceCard(
                  title: 'CRAM – Centro de Referência de Atendimento à Mulher',
                  coordinator: 'Coordenadora: Verônica Elisa Matos de Campos',
                  address:
                      'Endereço: Avenida Amélia Bernardini Cutrale, s/n – Jardim Novo Lar',
                  contact: 'Contato: (17) 3343-6157',
                ),
                const SizedBox(height: 20),
                // Sub-seção: Instituições de Terceiro Setor
                _buildSubSectionTitle('Instituições de Terceiro Setor'),
                const SizedBox(height: 10),
                // Lista de Instituições de Terceiro Setor
                _buildInstitutionCard(
                  title: 'APAE – Associação de Pais e Amigos dos Excepcionais',
                  address: 'Avenida São Francisco, 245 - Residencial Furquim',
                  cnpj: 'CNPJ: 45.306.008/0001-19',
                  phone: 'Telefone: (17) 3344-0300',
                  president: 'Presidente: Dr. Rogério Lemos Valverde',
                  coordinator: 'Coordenadora: Cássia Regina Ocaso',
                  email: 'Email: apaebebedouro@mdbrasil.com.br',
                ),
                _buildInstitutionCard(
                  title:
                      'AMO – Associação Menina dos Olhos dos Deficientes Visuais de Bebedouro',
                  address: 'Rua Vicente Paschoal, 891',
                  cnpj: 'CNPJ: 09.124.898/0001-84',
                  phone: 'Telefone: (17) 3345-2332',
                  president: 'Presidente: Sérgio Ricardo Stamato Ismael',
                  coordinator: 'Coordenadora: Maria Aparecida Chimelo dos Santos',
                  email: 'Email: associacaomeninadosolhos@hotmail.com',
                ),
                _buildInstitutionCard(
                  title: 'Casa de Santa Clara',
                  address: 'Avenida Miguel Burjaile, 62 - Residencial São Francisco',
                  cnpj: 'CNPJ: 06.696.188/0001-30',
                  phone: 'Telefone: (17) 3344-1527 / 3344-1528',
                  president: 'Presidente: Michelle Thais Zanardo Torres',
                  coordinator: 'Coordenadora: Lucimara Eliane Lopes',
                  email: 'Email: casadesantaclara@mdbrasil.com.br',
                ),
                _buildInstitutionCard(
                  title: 'Casa Santo Expedito',
                  address:
                      'Avenida Amélia Bernardini Cutrale, 2.500 – Jardim Novo Lar',
                  cnpj: 'CNPJ: 07.346.194/0001-20',
                  phone: 'Telefone: (17) 3345-1072',
                  president: 'Presidente: Pe. Marcelo Adriano Cervi',
                  coordinator: 'Coordenador: Jalili Carlomagno Saleh Gomes',
                  email: 'Email: casasantoexpedito@hotmail.com',
                ),
                _buildInstitutionCard(
                  title: 'Vila Vicentina',
                  address: 'Rua Valim, 652',
                  cnpj: 'CNPJ: 45.044.290/0001-57',
                  phone: 'Telefone: (17) 3342-5291',
                  president: 'Presidente: Neusa de Fátima Urbano da Silva',
                  coordinator:
                      'Coordenadores: Cada técnico é responsável pelo seu setor',
                  email: 'Email: vilavicentinabebedouro@hotmail.com',
                ),
                _buildInstitutionCard(
                  title: 'Vila Lucas Evangelista',
                  address: 'Rua Dr. Oscar Werneck, 1451 – Centro',
                  cnpj: 'CNPJ: 51.816.965/0001-98',
                  phone: 'Telefone: (17) 3345-3557',
                  president: 'Presidente: Walter Ap. Marciano',
                  coordinator: 'Coordenadora: Flávia Cristina da Silva Marangoni',
                  email: 'Email: socvilalucas@yahoo.com.br',
                ),
                _buildInstitutionCard(
                  title: 'Recanto Passionista São Vicente de Paulo',
                  address: 'Avenida Pedro Hortal, 1620 – Novo Lar',
                  cnpj: 'CNPJ: 60.919.909/0007-65',
                  phone: 'Telefone: (17) 3342-1423',
                  president: 'Presidente: Irmã Edilamar da Glória Martins',
                  coordinator: 'Coordenadora: Maria Aparecida Campanharo',
                  email: 'Email: apirecanto@mdbrasil.com.br',
                ),
                _buildInstitutionCard(
                  title: 'Lar do Idoso',
                  address: 'Alameda Corcovado, 222 - Residencial Parati',
                  cnpj: 'CNPJ: 57.726.978/0001-52',
                  phone: 'Telefone: (17) 3342-5268',
                  president: 'Presidente: Irmã Ledubina Nicomedes',
                  coordinator: 'Coordenadora: Lourdes Azevedo de Melo',
                  email: 'Email: lardoidoso.bebedouro@yahoo.com.br',
                ),
                _buildInstitutionCard(
                  title: 'CAECC – Albergue Noturno',
                  address: 'Rua Colina, 215 - Jardim Casa Grande',
                  cnpj: 'CNPJ: 45.304.854/0001-08',
                  phone: 'Telefone: (17) 3342-1056',
                  president: 'Presidente: Dorvanil Ferreira Cardoso',
                  coordinator: 'Coordenador: --',
                  email: 'Email: larespiritacaecc@uol.com.br',
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para construir títulos de seção
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
    );
  }

  // Método para construir subtítulos de seção
  Widget _buildSubSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
    );
  }

  // Método para construir cards de serviços
  Widget _buildServiceCard({
    required String title,
    required String coordinator,
    required String address,
    required String contact,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(coordinator),
              const SizedBox(height: 4),
              Text(address),
              const SizedBox(height: 4),
              Text(contact),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir cards de instituições
  Widget _buildInstitutionCard({
    required String title,
    required String address,
    required String cnpj,
    required String phone,
    required String president,
    required String coordinator,
    required String email,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.location_on, address),
                  _buildInfoRow(Icons.business, cnpj),
                  _buildInfoRow(Icons.phone, phone),
                  _buildInfoRow(Icons.person, president),
                  _buildInfoRow(Icons.person_outline, coordinator),
                  _buildInfoRow(Icons.email, email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para construir linhas de informação com ícones
  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
