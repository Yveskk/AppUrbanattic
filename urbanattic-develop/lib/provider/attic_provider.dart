import 'package:dio/dio.dart';
import 'package:urbanattic/model/attic_model.dart';

class AtticProvider {
  // Complete with api url (cc postman)
  static final API_URL = "";
  static final dio = Dio();

  static Future<List<Attic>> getList() async {
    var response = await dio.get(API_URL);
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data = response.data;
      List<Attic> listAttics = data
          .map((e) => Attic(
                id: e['id'],
                name: e['name'],
                images: e['images'],
              ))
          .toList();
      return listAttics;
    } else {
      return [];
    }
  }
}
