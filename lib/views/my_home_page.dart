import 'package:flutter/material.dart';
import 'package:tahap_2/data/api_servise.dart';
import 'package:tahap_2/widget/custom_form_input.dart';
import '../widget/custom_card.dart';
import 'form_input.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title1 = 'admin : ';
  var apiServise;

  @override
  void initState() {
    apiServise = ApiServise().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiServise().getData().then((value) => print("value: $value"));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 148, 215),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            Text(
              '$title1 ${widget.title}',
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.person,
              color: Colors.green,
              size: 35,
            ),
          ),
        ],
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    'List Mahasiswa',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const CustomCard(
              avatar:
                  'https://assets.jalantikus.com/assets/cache/550/550/userfiles/2021/04/29/3-Bergaya-ala-modis-b70b9.jpg.webp',
              name: 'yayat',
              stb: '1978372',
              major: 'tehnik informatika',
            ),
            const CustomCard(
              avatar:
                  'https://assets.jalantikus.com/assets/cache/550/550/userfiles/2021/04/29/3-Bergaya-ala-modis-b70b9.jpg.webp',
              name: 'reza',
              stb: '1978372',
              major: 'tehnik informatika',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormInput(),
            ),
          );
        },
        label: Row(
          children: const [
            Icon(Icons.add),
            Text(
              'Tambah data',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
