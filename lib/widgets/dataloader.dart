import 'dart:convert';

import 'package:flutter_cases/models/person.dart';
import 'package:flutter_cases/routes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataLoader extends StatelessWidget {
  const DataLoader({Key? key}) : super(key: key);

  Future<List<PersonSeri>> fetcher() async {
    const uri = "https://www.hduin.club/redhomer/2021.json";
    final res = await http.get(Uri.parse(uri));
    if (res.statusCode != 200) {
      throw res.reasonPhrase!;
    }
    final body = const Utf8Decoder().convert(res.bodyBytes);
    final data = json.decode(body);
    return (data as List).map((e) => PersonSeri.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PersonSeri>>(
      future: fetcher(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            '${snapshot.error}',
            style: const TextStyle(
              color: Colors.red,
            ),
          );
        }
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return HomePage(data: snapshot.data!);
      },
    );
  }
}
