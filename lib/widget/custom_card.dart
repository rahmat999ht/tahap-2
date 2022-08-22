import 'package:flutter/material.dart';
import '../views/details.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.name,
    this.avatar,
    required this.stb,
    required this.major,
  }) : super(key: key);
  final dynamic avatar;
  final String name;
  final String stb;
  final String major;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        color: Colors.brown,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Details(),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(avatar!),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    stb,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    major,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
