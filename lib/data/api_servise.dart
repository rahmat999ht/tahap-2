import 'dart:developer';
// import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'model_mhs.dart';

class ApiServise {
  // final apiUrl = 'http://192.168.1.100:5000/api/v1/mahasiswa/';
  final apiUrl = 'http://192.168.137.1:5000/api/v1/mahasiswa/';
  // final apiUrl = 'http://localhost:5000/api/v1/mahasiswa/';
  // final apiUrl = 'https://reqres.in/api/users?page=2';
  // Client client = Client();

  var listMhs = <ModelMhs>[];
  // List listMhs = [];

  Future<List<ModelMhs>?> getData() async {
    log("mulai");
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        listMhs = modelMhsFromJson(response.body);
        // for (var element in listMhs) {
        //   log(element.nameMhs);
        // }
        // log(response.body);
        // var resBody = await json.decode(response.body);
        // return resBody;
        return modelMhsFromJson(response.body);
        // return listMhs;
      }
    } catch (e) {
      log(e.toString());
    }
    log("selesai");
    return null;
    // return null;
  }
}
