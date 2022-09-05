import 'package:flutter/material.dart';
import 'package:tahap_2/data/api_servise.dart';
import 'package:tahap_2/data/model_mhs.dart';
import 'package:tahap_2/theme/colors.dart';
import 'package:tahap_2/views/form_input.dart';
import 'package:tahap_2/views/my_home_page.dart';
import 'package:tahap_2/widget/custom_button.dart';

import '../alerts/alert_delete.dart';

class Details extends StatelessWidget {
  final ModelMhs ditailsData;
  const Details({
    Key? key,
    required this.ditailsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(color: ColorSCustom.brownC),
        ),
      ),
      body: Container(
        color: Colors.white,
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
                  ditailsData.nameMhs,
                ),
                dataDetails(
                  'STB',
                  131,
                  ditailsData.stbMhs,
                ),
                dataDetails(
                  'Major',
                  122,
                  ditailsData.majorMhs,
                ),
                dataDetails(
                  'Gender',
                  113,
                  ditailsData.gender,
                ),
                dataDetails(
                  'Address',
                  106,
                  ditailsData.address,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomButton(
                  icon: Icons.delete_forever,
                  txButton: 'Delete',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDelete(
                          onPressedNo: () {
                            Navigator.pop(context);
                          },
                          onPressedYes: () {
                            ApiServise api = ApiServise();
                            api.deleteData(ditailsData.idMhs);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                    const MyHomePage(title: 'Yayat')),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                CustomButton(
                  icon: Icons.update_rounded,
                  txButton: 'Update',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            FormInput(updateData: ditailsData)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
              color: ColorSCustom.brownC,
            ),
          ),
          SizedBox(
            width: space,
          ),
          const Text(
            ':',
            style: TextStyle(
              color: ColorSCustom.brownC,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            details,
            style: const TextStyle(
              color: ColorSCustom.brownC,
            ),
          ),
        ],
      ),
    );
  }
}
