import 'dart:developer';
// import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'model_mhs.dart';

class ApiServise {
  // final apiUrl = 'http://192.168.1.100:5000/api/v1/mahasiswa/';
  // final apiUrl = 'http://192.168.8.131:5000/api/v1/mahasiswa/';
  final apiUrl = 'http://10.153.216.253:5000/api/v1/mahasiswa/';
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
        for (var element in listMhs) {
          log(element.nameMhs);
        }
        // log(response.body);
        return listMhs;
      }
    } catch (e) {
      log(e.toString());
    }
    log("selesai");
    return null;
  }

  Future createData(ModelMhs data) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: data.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future updateData(ModelMhs data) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl ${data.idMhs}'),
        body: data.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future deleteData(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$apiUrl $id'),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
