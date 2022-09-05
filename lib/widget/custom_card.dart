import 'package:flutter/material.dart';
import 'package:tahap_2/data/model_mhs.dart';
import 'package:tahap_2/theme/colors.dart';
import '../views/details.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.name,
    // this.avatar,
    required this.stb,
    required this.major,
    required this.modelMhs,
  }) : super(key: key);
  // final dynamic avatar;
  final String name;
  final String stb;
  final String major;

  final ModelMhs modelMhs;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorSCustom.brownBlurC,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        side: BorderSide(
          color: ColorSCustom.brownC,
          width: 1,
        ),
      ),
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(
                  ditailsData: modelMhs,
                ),
              ),
            );
          },
          child: Row(
            children: [
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
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    stb,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
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
