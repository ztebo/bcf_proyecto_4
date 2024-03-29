// test para leer archivos json
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';



class TestHome extends StatefulWidget {
  const TestHome({ super.key });

  @override
  TestHomeState createState() => TestHomeState();
}

class TestHomeState extends State<TestHome> {

  // Lista para guardar los elementos que vienen en el archivo JSON
  List _items = [];

  Future<void> cargarElementos() async {
    if (_items.isEmpty) {
      // Para leer el archivo json con los datos
      final String respuesta = await rootBundle.loadString('data/sample.json');
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
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.grey, Colors.transparent]
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: _items.isNotEmpty?ListView.builder(
                  padding: const EdgeInsets.all(2),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      key: ValueKey(_items[index]['name']),
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        style: ListTileStyle.list,
                        leading: const Icon(Icons.person_2_rounded),
                        title: Text(_items[index]['name']),
                        subtitle: Text(_items[index]['description']),
                        contentPadding: const EdgeInsets.all(5),
                        //trailing: Icon(Icons.turn_right),
                        onTap: () {
                          // Debe llevar a la pantalla de detalles del lugar desplegando más detalles del mismo                        
                        },
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
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {
            cargarElementos();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.cloud_upload_outlined),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
} 