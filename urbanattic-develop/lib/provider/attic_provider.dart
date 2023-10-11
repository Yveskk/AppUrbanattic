import 'package:dio/dio.dart';
import 'package:urbanattic/model/attic_model.dart';

class AtticProvider {
  final API_URL = "";
  final dio = Dio();

  Future<Attic>() async {
    var response = await dio.get(API_URL);
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data = response.data;
      List<Attic> listAttics = data
          .map((e) => Attic(
                id: e['id'],
                name: e['name'],
                images: e[''],
              ))
          .toList();
      return listAttics;
    } else {
      return [];
    }
  }
}
