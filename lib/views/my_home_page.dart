import 'package:flutter/material.dart';
import 'package:tahap_2/data/api_servise.dart';
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

  ApiServise dataApi = ApiServise();

  Future getDataAPi() async {
    await dataApi.getData();
  }

  @override
  void initState() {
    super.initState();
    dataApi.getData();
  }

  @override
  Widget build(BuildContext context) {
    // ApiServise().getData().then((value) => print("value: $value"));
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
            Expanded(
              child: ListView.builder(
                itemCount: dataApi.listMhs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = dataApi.listMhs[index];
                  // log(data.toString());
                  return CustomCard(
                    name: data.nameMhs,
                    stb: data.stbMhs,
                    major: data.majorMhs,
                    modelMhs: data,
                  );
                },
              ),
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
