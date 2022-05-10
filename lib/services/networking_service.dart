import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_api_service.dart';

class NetWorkingService extends BaseApiService {
  @override
  Future getResponse() async {
    dynamic jsonResponse;

    try {
      final response = await http.get(Uri.parse(baseUrl));
      jsonResponse = returnResponse(response);
    } on Exception {
      throw Exception('');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
      case 401:
      case 403:
      case 404:
      case 500:

      case 500:
        throw Exception(response.toString());
    }
  }
}
