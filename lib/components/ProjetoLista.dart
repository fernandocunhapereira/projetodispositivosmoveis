import 'package:projeto/model/projeto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjetoLista extends StatelessWidget {
  List<Projeto> _projetoLista;

  ProjetoLista(this._projetoLista);

  @override
  Widget build(BuildContext context) {
    if(_projetoLista.isEmpty){
      return Text('lista DE projetos vazi');
    }
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: _projetoLista.length,
        itemBuilder: (context, index) {
          final projeto = _projetoLista[index];
          return GestureDetector(
            onTap: _onClick,
            child: Card(
              child: Row(
                children: [
                  Text(projeto.titulo),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: projeto.prazo.day >= DateTime.now().day
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(DateFormat('d MMM y').format(projeto.prazo),
                          style: TextStyle(
                              color: projeto.prazo.day >= DateTime.now().day
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onClick() {

  }
}
