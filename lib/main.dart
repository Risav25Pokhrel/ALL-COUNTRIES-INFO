import 'package:country_info/screen/allcountries.dart';
import 'package:flutter/material.dart';
void main() {
  
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "COUNTRIES",
    home: new stopping(),
  ));
}

class stopping extends StatelessWidget {
  const stopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        elevation: 10,
        child: Center(
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new allcountries()));
              },
              icon: Icon(Icons.start),
              label: Text(
                "START",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
