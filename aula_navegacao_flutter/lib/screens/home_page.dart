import 'package:flutter/material.dart';
import './perfil_page.dart';
import './cardapio_page.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int indiceAtual=0;

    final List<Widget> telas = [
      HomeContent(),
      PerfilPage(),
      CardapioPage()
    ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(title: Text('Tela Inicial')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color :Colors.blue),
              child: Text('Menu', style:TextStyle(color: Colors.white))
            ),
            ListTile(
              title: Text('Home'),
              onTap: (){Navigator.pop(context);},
            ),
            ListTile(
              title: Text('Perfil'),
              onTap: (){Navigator.pushNamed(context, '/perfil');}
            ),
            ListTile(
              title: Text('Cardápio'),
              onTap: (){Navigator.pushNamed(context, '/cardapio');}
            )
          ],
        ),
      ),
      body: telas[indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceAtual,
        onTap: (index){
          setState(() {
            indiceAtual = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Cardápio'),
        ],
      ),
    );
  }
}


class HomeContent extends StatelessWidget{
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Conteudo da tela inicial'),
            SizedBox(height: 20),
            Text('Conteudo do corpo da tela incial.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){Navigator.pushNamed(context, '/perfil');},
              child: Text ('Acessar o Perfil')
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){Navigator.pushNamed(context, '/cardapio');},
              child: Text ('Acessar o Cardápio')
            )
          ],
        ),
      );
  }
}