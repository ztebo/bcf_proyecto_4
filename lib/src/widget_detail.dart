import 'package:flutter/material.dart';

/*
Este widget tiene la misión de desplegar los detalles del lugar que se seleccionó
en la pantalla de ListView.
*/

class WidgetDetail extends StatefulWidget {
  const WidgetDetail({
    Key? key,
    required this.name,
    required this.description,
    required this.cell,
    required this.picture,
    required this.location,
    required this.link,
    required this.curiosity
  }) : super(key: key);

  final String name;
  final String description;
  final String cell;
  final String picture;
  final String location;
  final String link;
  final String curiosity;  

  @override
  _WidgetDetail createState() => _WidgetDetail();
}

class _WidgetDetail extends State<WidgetDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background2.png'),
              fit: BoxFit.fill
            )
        ),
        child: Hero(
          tag: 'myTag',
          child: Column(
            children: [
              Container(
                height: 300, // Specify a height
                width: double.infinity, // Specify a width
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.picture),
                    fit: BoxFit.cover, // Make sure the image covers the container
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                textAlign: TextAlign.center,
                widget.name,
                style: const TextStyle(
                  fontSize: 25
                ),
              ),
              const SizedBox(height: 10,),
              const Row(              
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [                  
                  Column(
                    children: [
                      Icon(Icons.call),
                      Text('Llamar', style: TextStyle(fontSize: 12),),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.location_on),
                      Text('Ubicación', style: TextStyle(fontSize: 12),),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.link_sharp),
                      Text('Web',style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12
                  ),
                  ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '"  ${widget.curiosity}  "',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back_sharp),
      ),
      
      
    );
  }
}