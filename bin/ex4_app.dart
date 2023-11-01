import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  try {
    final Uri url =
        Uri.parse('https://random-data-api.com/api/users/random_user?size=10');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      List<Map<String, dynamic>> users =
          List<Map<String, dynamic>>.from(json.decode(res.body));
      print(
          "----------------------------------------------------------------------");

      for (var user in users) {
        String userDetails =
            '| UID: ${user['uid']} | Name: ${user['first_name']} ${user['last_name']}';
        print(userDetails);
        print(
            "----------------------------------------------------------------------");
      }
    } else {
      print('Failed when loading  users. Status Code: ${res.statusCode}');
    }
  } catch (error) {
    print('Error when fetching users: $error');
  }
}
