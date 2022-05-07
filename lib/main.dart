import 'package:flutter/material.dart';
import 'package:projeto/components/ProjetoLista.dart';
import 'package:projeto/model/projeto.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Color.fromARGB(255, 44, 19, 231),
                secondary: Color.fromARGB(255, 7, 255, 226),
              )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _novoProjeto(int id, String titulo, DateTime prazo, String descricao) {
    Projeto novoProjeto = Projeto(
        id: id, titulo: titulo, prazo: prazo, descricao: descricao);

    setState(() {
      _projetos.add(novoProjeto);
    });
  }

  List<Projeto> _projetos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de Projetos'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[ProjetoLista(_projetos)],
            )
          ],
        ),
      ),
    );
  }
}