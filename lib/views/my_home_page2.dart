import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tahap_2/widget/custom_card.dart';

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Uri apiUrl = Uri.parse("https://reqres.in/api/users?page=2");

    // final String apiUrl = "https://reqres.in/api/users?page=15";

    Future<List<dynamic>> _fecthDataUsers() async {
      // Uri apiUrl2 = apiUrl.toString() as Uri;
      var result = await http.get(apiUrl);
      return json.decode(result.body)['data'];
    }

    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapsot) {
            if (snapsot.hasData) {
              return SizedBox(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: snapsot.data.length,
                    // itemCount: modelMhs.length,

                    itemBuilder: (BuildContext context, int index) {
                      // print("object");
                      // return ListTile(
                      //   leading: CircleAvatar(
                      //     radius: 30,
                      //     backgroundImage:
                      //         NetworkImage(snapsot.data[index]['avatar']),
                      //   ),
                      //   title: Text(
                      //       "${snapsot.data[index]['first_name']}  ${snapsot.data[index]['last_name']}"),
                      //   subtitle: Text(snapsot.data[index]['email']),
                      //   // subtitle: Text(modelMhs.nameMhs),
                      // );
                      return CustomCard(
                        // avatar: snapsot.data[index]['avatar'],
                        name: snapsot.data[index]['first_name'],
                        stb: snapsot.data[index]['last_name'],
                        major: snapsot.data[index]['email'],
                        modelMhs: snapsot.data,
                      );
                    }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
