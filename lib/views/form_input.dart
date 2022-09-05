import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tahap_2/data/api_servise.dart';
import 'package:tahap_2/data/model_mhs.dart';
import 'package:tahap_2/theme/colors.dart';
import 'package:tahap_2/views/my_home_page.dart';
import '../widget/custom_button.dart';
import '../widget/custom_dropdown.dart';
import '../widget/custom_form_field.dart';

class FormInput extends StatefulWidget {
  final ModelMhs? updateData;
  const FormInput({
    Key? key,
    this.updateData,
  }) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final List itemsMajor = ['Tehnik Informatika', 'Sistem Informatika'];
  String valueMajor = 'Tehnik Informatika';

  final List itemsGender = ['Laki-laki', 'Perempuan'];
  String valueGender = 'Laki-laki';

  TextEditingController nameC = TextEditingController();
  TextEditingController stbC = TextEditingController();
  TextEditingController addressC = TextEditingController();

  @override
  void initState() {
    super.initState();
    valueMajor = itemsMajor.first;
    valueGender = itemsGender.first;
    log(widget.updateData?.idMhs.toString() ?? 'kosong');
    if (widget.updateData != null) {
      nameC.text = widget.updateData!.nameMhs;
      stbC.text = widget.updateData!.stbMhs;
      addressC.text = widget.updateData!.address;
      valueMajor = widget.updateData!.majorMhs;
      valueGender = widget.updateData!.gender;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                widget.updateData == null ? 'Form Add data' : ' Update data',
                style:
                    const TextStyle(fontSize: 30, color: ColorSCustom.brownC),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomFormInput(
                label: 'Name',
                controller: nameC,
              ),
              CustomFormInput(
                label: 'Stb',
                controller: stbC,
              ),
              CustomDropDown(
                label: 'Major',
                items: itemsMajor,
                value: valueMajor,
                onChanged: (newValue) {
                  setState(
                    () {
                      valueMajor = newValue ?? 'Tehnik Informatika';
                    },
                  );
                },
              ),
              CustomDropDown(
                label: 'Gender',
                items: itemsGender,
                value: valueGender,
                onChanged: (newValue) {
                  setState(
                    () {
                      valueGender = newValue ?? 'Laki-laki';
                    },
                  );
                },
              ),
              CustomFormInput(
                label: 'Address',
                controller: addressC,
              ),
              CustomButton(
                icon: Icons.save_rounded,
                txButton: widget.updateData == null ? 'Save' : 'Update',
                onPressed: () {
                  ApiServise api = ApiServise();
                  ModelMhs modelMhs = ModelMhs(
                    idMhs: widget.updateData?.idMhs ?? 0,
                    nameMhs: nameC.text.toString(),
                    stbMhs: stbC.text.toString(),
                    majorMhs: valueMajor.toString(),
                    gender: valueGender.toString(),
                    address: addressC.text.toString(),
                  );
                  // widget.updateData == null
                  //     ? api.createData(modelMhs)
                  //     : api.updateData(modelMhs);
                  if (widget.updateData == null) {
                    api.createData(modelMhs);
                  } else {
                    api.updateData(modelMhs);
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MyHomePage(title: 'Yayat');
                      },
                    ),
                  );
                },
              ),
              CustomButton(
                icon: Icons.cancel_rounded,
                txButton: 'Cancel',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
