import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Gpt {
  Future<String> getData(String prompt) async {
    String link = "https://api.openai.com/v1/chat/completions";
    var uri = Uri.parse(link);

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${dotenv.env['OPENAI_API_KEY']}"
    };
    var body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "You are a helpful assistant for tour ksa app short answer only about saudi arabia Tourist places."
        },
        {"role": "user", "content": prompt}
      ]
    };
    var request =
        await http.post(uri, headers: header, body: json.encode(body));

    var response = json.decode(request.body);
    String content = response["choices"][0]["message"]["content"];
    print(content);
    return content;
  }
}
