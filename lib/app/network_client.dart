import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkClient {
  final String _baseUrl = "https://herosapp.nyc3.digitaloceanspaces.com/";

  Future<dynamic> get(String url) async {
    dynamic returnResponse;

    try {
      final response = await http.get(Uri.parse(_baseUrl + url)).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw Exception([408, 'Request timeout']);
        },
      );
      if (response.body.isNotEmpty) {
          Map<String, dynamic> responseJson =
              jsonDecode(response.body.toString());
          returnResponse = responseJson;
        }
      else{
          throw Exception([400, 'Error while fetching data']);
      }
    } on SocketException {
      throw const SocketException('No Internet connection');
    }

    return returnResponse;
  }
}
