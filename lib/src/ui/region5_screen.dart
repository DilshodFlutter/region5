import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:region5/src/model/region5_model.dart';

class Region5Screen extends StatefulWidget {
  const Region5Screen({Key? key}) : super(key: key);

  @override
  State<Region5Screen> createState() => _Region5ScreenState();
}

class _Region5ScreenState extends State<Region5Screen> {
  List<Region5Model> data = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(data[index].name),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data[index].childs.length,
                      itemBuilder: (context, position) {
                        return Column(
                          children: [
                            Container(
                                child: Text(data[index].childs[position].name),
                            color: Colors.red,
                            )
                          ],
                        );
                      })
                ],
              );
            }),
      ),
    );
  }

  void _getData() async {
    String url =
        "https://api.osonapteka.uz/api/v1/regions?lan=uz&user=4ec8cc4ef07d43e6";
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);

    data = region5ModelFromJson(response.body);
    setState(() {});
  }
}
