// test para leer archivos json
import 'package:bcf_proyecto_21/src/widget_detail.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';



class MyHome extends StatefulWidget {
  const MyHome({ super.key });

  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {

  // Lista para guardar los elementos que vienen en el archivo JSON
  List _items = [];

  // Índice del elemento seleccionado
  int selectedItem = 0;

  @override
  void initState() {
    // Para asegurar que los elementos de la lista se carguen al iniciar la aplicación
    super.initState();
    cargarElementos();
  }

  Future<void> cargarElementos() async {
    // Método para cargar elementos del archivo json
    if (_items.isEmpty) {
      // Para leer el archivo json con los datos
      final String respuesta = await rootBundle.loadString('data/places.json');
      final data = json.decode(respuesta);
      setState(() {
        
        // ignore: avoid_print
        //print(fin);
        _items = data["items"];
      });
    }
    else {
      // Hará esto en caso de que haya elementos paa ir alternando entre una lista con elementos
      // y una lista vacía
      setState(() {
        _items = [];
      });
    }
  }

  void seeDetails(int selectedIndex){    
    // Método para cargar la pantalla que muestra el destino seleccionado
    //Question.modifyTopic(value);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WidgetDetail(
            name: _items[selectedIndex]['name'],
            description: _items[selectedIndex]['description'],
            cell: _items[selectedIndex]['cell'],
            picture: _items[selectedIndex]['picture'],
            location: _items[selectedIndex]['location'],
            link: _items[selectedIndex]['link_web'], 
            curiosity: _items[selectedIndex]['curiosity'],
          
          ),
        fullscreenDialog: true,
      ),
    );      
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Prueba de carga'),
      ),*/
      body: 
          SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background1.png'),
                  fit: BoxFit.fill
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _items.isNotEmpty?ListView.builder(
                  padding: const EdgeInsets.all(3),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      key: ValueKey(_items[index]['name']),
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        style: ListTileStyle.list,
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/refugio_secreto.jpg'),
                        ),
                        title: Text(_items[index]['name']),
                        subtitle: Text(_items[index]['description']),
                        contentPadding: const EdgeInsets.all(10),
                        //trailing: Icon(Icons.turn_right),
                        onTap: () => seeDetails(index),
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        //trailing:Text(_items[index]['curiosity']),
                
                      ),
                    );
                  }
                ):
                const Text('El archivo JSON aún no ha sido cargado', textAlign: TextAlign.center,),
              ),
            ),
          )
            
      ,       
    );
  }
}
