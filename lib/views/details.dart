import 'package:flutter/material.dart';
import 'package:tahap_2/widget/custom_button.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.brown,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                dataDetails(
                  'Name',
                  120,
                  'Yayat',
                ),
                dataDetails(
                  'STB',
                  131,
                  '192555',
                ),
                dataDetails(
                  'Major',
                  122,
                  'Tehnik Informatika',
                ),
                dataDetails(
                  'Gender',
                  113,
                  'Laki-laki',
                ),
                dataDetails(
                  'Address',
                  106,
                  'BTP',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomButton(
                  icon: Icons.delete_forever,
                  txButton: 'Delete',
                  onPressed: () {},
                ),
                CustomButton(
                  icon: Icons.update_rounded,
                  txButton: 'Update',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget dataDetails(
  String data,
  double space,
  String details,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Text(
          data,
          style: const TextStyle(
            color: Colors.brown,
          ),
        ),
        SizedBox(
          width: space,
        ),
        const Text(
          ':',
          style: TextStyle(
            color: Colors.brown,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          details,
          style: const TextStyle(
            color: Colors.brown,
          ),
        ),
      ],
    ),
  );
}
