import 'package:trymovi/models/parsed.dart';
import 'package:http/http.dart' as http;

class Watch {
  Future<Film?> getwatch() async {
    var client = http.Client();
    var uri = Uri.parse('http://www.omdbapi.com/?i=tt3896198&apikey=b444edf7');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;

      return filmFromJson(json);
    }
  }
}
