import 'package:flutter/material.dart';
import 'package:artify/screens/login_page.dart';

// MyHomePage
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var myIcon = const Icon(Icons.image);
    var iconSizee = 32.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Define a cor de fundo do app bar como branco
        elevation: 0, // Remove a sombra da app bar
        automaticallyImplyLeading: false, // Remove a seta de volta
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/icons/logo.png',
                height: 32, // Define a altura da imagem como 32
                width: 32, // Define a largura da imagem como 32
              ), // Adiciona o logo
            ),
            const SizedBox(
              width: 1, // Adiciona um espaço vazio com largura de 8
            ),
            const Text(
              'Artify',
              style: TextStyle(
                color: Colors.black, // Define a cor do texto como preto
                fontWeight:
                    FontWeight.bold, // Define a espessura da fonte como negrito
                fontSize: 25, // Define o tamanho da fonte como 20
              ),
            ),
            const Spacer(), // Adiciona um espaço vazio para separar os ícones
            IconButton(
              onPressed: () {
                // Adicione o código para a ação do botão de download aqui
              },
              icon: const Icon(Icons.download),
              color: Colors.black,
              hoverColor: Colors.transparent,
              // hoverColor: Colors.grey.withOpacity(0.1),
              splashRadius: 30,
              iconSize: iconSizee,
              tooltip: 'Download',
            ),
            IconButton(
              onPressed: () {
                // Adicione o código para a ação do botão de notificações aqui
              },
              icon: const Icon(Icons.notifications),
              color: Colors.black,
              hoverColor: Colors.grey.withOpacity(0.1),
              splashRadius: 30,
              iconSize: iconSizee,
              tooltip: 'Notificações',
            ),
            GestureDetector(
              onTap: () {
                // Add your onTap logic here
                print('Column tapped!');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    child: IconButton(
                      icon: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          'assets/icons/logo.png',
                          height: iconSizee,
                          width: iconSizee,
                        ),
                      ),
                      onPressed: () {
                        print('Column pressedS!');
                      },
                      hoverColor: Colors.transparent,
                      splashRadius: 32,
                      iconSize: iconSizee,
                      splashColor: Colors.grey.withOpacity(0.4),
                      tooltip: 'Imagem Google',
                    ),
                  ),
                  const Text('ruben', style: TextStyle(fontSize: 10)),
                ],
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to second page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyLoginPage()),
            );
            // Navigator.pushNamed(
            //   context,
            //   '/search',
            //   arguments: 'Hello from MyHomePage',
            // );
          },
        ),
      ),
    );
  }
}
