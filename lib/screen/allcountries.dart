import 'package:country_info/screen/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class allcountries extends StatefulWidget {
  const allcountries({Key? key}) : super(key: key);

  @override
  State<allcountries> createState() => _allcountriesState();
}

class _allcountriesState extends State<allcountries> {
  late Future<List> countries;
  Future<List> getcountries() async {
    var response = await Dio().get('https://restcountries.com/v2/all');
    return response.data;
  }

  @override
  void initState() {
    countries = getcountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: const Text("ALL COUNTRIES"))),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List>(
              future: countries, // a previously-obtained Future<String> or null
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    country1(snapshot.data![index])));
                          },
                          child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data![index]['name'],
                                  style: const TextStyle(fontSize: 20),
                                ),
                              )),
                        );
                      });
                } else {
                  return Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Center(child: Image.asset("imag/loader.gif")),
                      CircularProgressIndicator(),
                    ],
                  ));
                }
              }),
        ));
  }
}
