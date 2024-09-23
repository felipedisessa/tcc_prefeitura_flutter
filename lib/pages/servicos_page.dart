import 'package:flutter/material.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({Key? key}) : super(key: key);

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
                  'Serviços Oferecidos',
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
                      'assets/servicos.png',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Seção: Atendimento no Serviço Público
                const Text(
                  'Atendimento no Serviço Público',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
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
                const Text(
                  'Atendimento nas Instituições de Terceiro Setor',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                // Lista de Instituições
                _buildInstitutionCard(
                  title: 'ARTSOL – Arte e Solidariedade',
                  address: 'Endereço: Rua Atilio Favero, 1714 - Jardim Alvorada',
                  cnpj: 'CNPJ: 07.992.978/0001-26',
                  phone: 'Telefone: (17) 3343-8070',
                  president: 'Presidente: Manoel Cosme Coelho',
                  coordinator: 'Coordenadora: Simone Cristina de Paula Alencar Inácio',
                  email: 'Email: visimabru@yahoo.com.br',
                ),
                _buildInstitutionCard(
                  title: 'DCA – Desenvolvendo a Criança e o Adolescente',
                  address: 'Endereço: Alameda Miguel Muchaque, 1214',
                  cnpj: 'CNPJ: 60.249.067/0001-96',
                  phone: 'Telefone: (17) 3343-3643',
                  president: 'Presidente: Vanda Ap. Lodo Conceição',
                  coordinator: 'Coordenadora: Maria Aparecida Chimelo dos Santos',
                  email: 'Email: dca@mdbrasil.com.br',
                ),
                _buildInstitutionCard(
                  title: 'ESA – Educandário Santo Antônio',
                  address: 'Endereço: Praça Nivaldo Salvador, 95 - Vila Major Cicero de Carvalho',
                  cnpj: 'CNPJ: 51.796.621/0001-64',
                  phone: 'Telefone: (17) 3344-1520',
                  president: 'Presidente: Márcia Heloísa Iquegami',
                  coordinator: 'Coordenadora: Lislene Cunha Rissi Taraldo',
                  email: 'Email: educandario@mdbrasil.com.br',
                ),
                const SizedBox(height: 20),
                // Seção: Proteção Social Especial de Média Complexidade
                const Text(
                  'Proteção Social Especial de Média Complexidade',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'A Proteção Social Especial objetiva proteger famílias e indivíduos em situação de risco, cujos direitos tenham sido violados.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                // Sub-seção: Serviços Públicos
                const Text(
                  'Serviços Públicos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
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
                const Text(
                  'Instituições de Terceiro Setor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                // Lista de Instituições de Terceiro Setor
                _buildInstitutionCard(
                  title: 'APAE – Associação de Pais e Amigos dos Excepcionais',
                  address: 'Endereço: Avenida São Francisco, 245 - Residencial Furquim',
                  cnpj: 'CNPJ: 45.306.008/0001-19',
                  phone: 'Telefone: (17) 3344-0300',
                  president: 'Presidente: Dr. Rogério Lemos Valverde',
                  coordinator: 'Coordenadora: Cássia Regina Ocaso',
                  email: 'Email: apaebebedouro@mdbrasil.com.br',
                ),
                _buildInstitutionCard(
                  title:
                      'AMO – Associação Menina dos Olhos dos Deficientes Visuais de Bebedouro',
                  address: 'Endereço: Rua Vicente Paschoal, 891',
                  cnpj: 'CNPJ: 09.124.898/0001-84',
                  phone: 'Telefone: (17) 3345-2332',
                  president: 'Presidente: Sérgio Ricardo Stamato Ismael',
                  coordinator: 'Coordenadora: Maria Aparecida Chimelo dos Santos',
                  email: 'Email: associacaomeninadosolhos@hotmail.com',
                ),
                _buildInstitutionCard(
                  title: 'Casa de Santa Clara',
                  address: 'Endereço: Avenida Miguel Burjaile, 62 - Residencial São Francisco',
                  cnpj: 'CNPJ: 06.696.188/0001-30',
                  phone: 'Telefone: (17) 3344-1527 / 3344-1528',
                  president: 'Presidente: Michelle Thais Zanardo Torres',
                  coordinator: 'Coordenadora: Lucimara Eliane Lopes',
                  email: 'Email: casadesantaclara@mdbrasil.com.br',
                ),
                _buildInstitutionCard(
                  title: 'Casa Santo Expedito',
                  address:
                      'Endereço: Avenida Amélia Bernardini Cutrale, 2.500 – Jardim Novo Lar',
                  cnpj: 'CNPJ: 07.346.194/0001-20',
                  phone: 'Telefone: (17) 3345-1072',
                  president: 'Presidente: Pe. Marcelo Adriano Cervi',
                  coordinator: 'Coordenador: Jalili Carlomagno Saleh Gomes',
                  email: 'Email: casasantoexpedito@hotmail.com',
                ),
                _buildInstitutionCard(
                  title: 'Vila Vicentina',
                  address: 'Endereço: Rua Valim, 652',
                  cnpj: 'CNPJ: 45.044.290/0001-57',
                  phone: 'Telefone: (17) 3342-5291',
                  president: 'Presidente: Neusa de Fátima Urbano da Silva',
                  coordinator:
                      'Coordenadores: Cada técnico é responsável pelo seu setor',
                  email: 'Email: vilavicentinabebedouro@hotmail.com',
                ),
                _buildInstitutionCard(
                  title: 'Vila Lucas Evangelista',
                  address: 'Endereço: Rua Dr. Oscar Werneck, 1451 – Centro',
                  cnpj: 'CNPJ: 51.816.965/0001-98',
                  phone: 'Telefone: (17) 3345-3557',
                  president: 'Presidente: Walter Ap. Marciano',
                  coordinator: 'Coordenadora: Flávia Cristina da Silva Marangoni',
                  email: 'Email: socvilalucas@yahoo.com.br',
                ),
                _buildInstitutionCard(
                  title: 'Recanto Passionista São Vicente de Paulo',
                  address: 'Endereço: Avenida Pedro Hortal, 1620 – Novo Lar',
                  cnpj: 'CNPJ: 60.919.909/0007-65',
                  phone: 'Telefone: (17) 3342-1423',
                  president: 'Presidente: Irmã Edilamar da Glória Martins',
                  coordinator: 'Coordenadora: Maria Aparecida Campanharo',
                  email: 'Email: apirecanto@mdbrasil.com.br',
                ),
                _buildInstitutionCard(
                  title: 'Lar do Idoso',
                  address: 'Endereço: Alameda Corcovado, 222 - Residencial Parati',
                  cnpj: 'CNPJ: 57.726.978/0001-52',
                  phone: 'Telefone: (17) 3342-5268',
                  president: 'Presidente: Irmã Ledubina Nicomedes',
                  coordinator: 'Coordenadora: Lourdes Azevedo de Melo',
                  email: 'Email: lardoidoso.bebedouro@yahoo.com.br',
                ),
                _buildInstitutionCard(
                  title: 'CAECC – Albergue Noturno',
                  address: 'Endereço: Rua Colina, 215 - Jardim Casa Grande',
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

  // Método para construir cards de serviços
  Widget _buildServiceCard({
    required String title,
    required String coordinator,
    required String address,
    required String contact,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                )),
            const SizedBox(height: 8),
            Text(coordinator,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                )),
            const SizedBox(height: 4),
            Text(address,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                )),
            const SizedBox(height: 4),
            Text(contact,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                )),
          ],
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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                Text(address,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    )),
                const SizedBox(height: 4),
                Text(cnpj,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    )),
                const SizedBox(height: 4),
                Text(phone,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    )),
                const SizedBox(height: 4),
                Text(president,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    )),
                const SizedBox(height: 4),
                Text(coordinator,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    )),
                const SizedBox(height: 4),
                Text(email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
