import 'package:flutter/material.dart';

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
      
      
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background2.png'),
                fit: BoxFit.fill
              )
          ),
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
                widget.name,
                style: const TextStyle(
                  fontSize: 30
                ),
              ),
              const SizedBox(height: 10,),
              Row(              
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.call),
                  Icon(Icons.location_on),
                  Icon(Icons.link_sharp)
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12
                  ),
                  ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '" ' + widget.curiosity + ' "',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
        child: Icon(Icons.arrow_back_sharp),
      ),
      
      
    );
  }
}