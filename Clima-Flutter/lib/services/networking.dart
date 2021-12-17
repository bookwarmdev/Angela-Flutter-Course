import 'dart:convert'; 
import 'package:http/http.dart' as http;

class Networking {
  final String url;
  var lon, lat;
  Networking({this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
    var data = response.body;
    print(jsonDecode(data));
    return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  } 
}
