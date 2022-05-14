import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class country1 extends StatefulWidget {
  final Map country;
   country1(this.country);

  @override
  State<country1> createState() => _country1State();
}

class _country1State extends State<country1> {
  // const country({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.country['name']),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: cardinfo("FLAG"),
                back: Card(
                  elevation: 20,
                  color: Color.fromARGB(255, 232, 227, 227),
                  child: Image.network(widget.country['flags']['png']),
                )),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: cardinfo("CAPITAL CITY"),
                back: countryinfo(widget.country['capital'], Colors.blue)),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: cardinfo("POPULATION"),
                back: countryinfo(widget.country['population'].toString(),
                    Colors.lightGreen)),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: cardinfo("CONTINENTS"),
                back: countryinfo(widget.country['region'], Colors.lime)),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: cardinfo("AREA(sq KM)"),
                back: countryinfo(
                    widget.country['area'].toString(), Colors.pink)),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: cardinfo("CURRENCY"),
                back: countryinfo(
                    widget.country['currencies'][0]['name'], Colors.blueGrey)),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: cardinfo("NATIONAL LANGUAGE"),
                back: countryinfo(
                    widget.country['languages'][0]['name'], Colors.amber)),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: cardinfo("NATIVE NAME"),
                back: countryinfo(widget.country['nativeName'], Colors.cyan)),
          ],
        ),
      ),
    );
  }
}

class cardinfo extends StatelessWidget {
  String title;
  cardinfo(this.title);
  //const cardinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}

class countryinfo extends StatelessWidget {
  final String name;
  final MaterialColor color1;
  countryinfo(this.name, this.color1);
  //const countryinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color1,
      elevation: 10,
      child: Center(
          child: Text(
        name,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      )),
    );
  }
}
