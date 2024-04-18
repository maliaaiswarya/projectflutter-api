
import 'package:http/http.dart' show Client;

class Network {
  Client client = Client();

  Future<dynamic> getRequest(String url) async {
    final response = await client.get(
        Uri.parse(url),
    );


    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }

  Future<dynamic> putRequest(String url, dynamic body) async {
    final response = await client.put(
        Uri.parse(url),
      headers: {
        "Accept": "application/json",
      },
      body: body,
    );

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }

  Future<dynamic> postRequest(String url, dynamic body) async {
    final response = await client.post(
        Uri.parse(url),
      headers: {
        "Accept": "application/json",
      },
      body: body,
    );

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }
}
