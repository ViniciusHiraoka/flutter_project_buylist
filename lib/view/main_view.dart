// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers, override_on_non_overriding_member

import 'package:flutter/material.dart';
import '../model/listas.dart';
 
class MainView extends StatefulWidget {
  const MainView({super.key});
 
  @override
  State<MainView> createState() => _MainViewState();
}
 
class _MainViewState extends State<MainView> {
 
  var formkey = GlobalKey<FormState>();

  var txtlista = TextEditingController();

  List<ListaCompra> dados = [];

  @override
  void initstate(){
    dados = ListaCompra.preencher();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'lib/imagens/carrinho.png',
          width: 40,
          height: 40,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: ListView.builder(
          // Quantidade de listas de compra
          itemCount: dados.length,
          
          // Aparencia das listas
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.shopping_bag),

                title: Text(dados[index].nome),

                onTap: (){
                  Navigator.pushNamed(
                      context,
                      'lista_exemplo',
                    );
                },
                hoverColor: Colors.red.shade100,

                onLongPress: (){
                  setState(() {
                    dados.removeAt(index);
                  });
                },
              )
            );
          }
        ),
      ),
        // floating action button needs to be in the Scaffold widget
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade100,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
	              title: const Text('Criar lista'),
                content: TextFormField(
                  controller: txtlista,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Nome da lista'
                  ),
                
                  validator: (value){
                    if(value == null){
                      return 'Insira o nome da lista';
                    }
                    else if(value.isEmpty){
                      return 'Insira o nome da lista';
                    }
                    return null;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancelar'),
                    child: const Text('Cancelar'),
                  ),
                  
                  TextButton(
                    onPressed: (){
                      if(formkey.currentState!.validate()){
                        Navigator.pop(
                          context,
                          'Criar'
                        );
                      }
                    },
                    child: const Text('Criar'),
                  ),
                ],
              ),
            );
          },
        ),
    );
  }
}




/*

      ListView.builder(
              itemCount: dados.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(

                    title: Text(dados[index].nome),

                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(dados[index].nome))    
                      );
                    },
                  ),
                );
              },
            ),

            TextFormField(
                controller: txtlista,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Nome da lista'
                ),

                validator: (value){
                  if(value == null){
                    return 'Insira o nome da lista';
                  }
                  else if(value.isEmpty){
                    return 'Insira o nome da lista';
                  }
                  return null;
                },
              ),
*/