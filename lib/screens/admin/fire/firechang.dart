import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkoffice/models/firelistmodel.dart';
import 'package:http/http.dart' as http;
import 'package:pkoffice/utility/my_constant.dart';

class FireChang extends StatefulWidget {
  final FireListmodel fireModelchang;
  const FireChang({super.key, required this.fireModelchang});
  // const FireChang({super.key});

  @override
  State<FireChang> createState() => _FireChangState();
}

class _FireChangState extends State<FireChang> {
  final formKey = GlobalKey<FormState>();
  late FireListmodel _fireModelchang;
  String? fire_id, fire_num, fire_name, fire_size, fire_color, fire_location;
  List<FireListmodel> fireModel = [];
  @override
  void initState() {
    super.initState();
    _fireModelchang = widget.fireModelchang;
    fire_id = _fireModelchang.fire_id;
    fire_num = _fireModelchang.fire_num;
    fire_name = _fireModelchang.fire_name;
    fire_size = _fireModelchang.fire_size;
    fire_color = _fireModelchang.fire_color;
    fire_location = _fireModelchang.fire_location;

    // getfire();
  }

  Future<List<FireListmodel>> getfire() async {
    try {
      final response = await http.get(Uri.parse(
          '${MyConstant.domain}/pkoffice/api/getfirechang.php?isAdd=true'));
      final body = json.decode(response.body) as List;
      if (response.statusCode == 200) {
        return body.map((e) {
          final map = e as Map<String, dynamic>;
          return FireListmodel(
              fire_id: map['fire_id'],
              fire_num: map['fire_num'],
              fire_name: map['fire_name']);
        }).toList();
      }
    } on SocketException {
      throw Exception('Failed Network Connect Error');
    }
    throw Exception('Failed to get Data error.');
  }

  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: const EdgeInsets.only(right: 35),
          child: Center(
            child: Text(
              'เปลี่ยนถังดับเพลิงรหัส $fire_num',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: const TextStyle(
                  fontSize: 17,
                  fontFamily: 'Kanit-Regular',
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder<List<FireListmodel>>(
              future: getfire(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton(
                    value: selectedValue,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    hint: const Text('Select Fire Item'),
                    items: snapshot.data!.map((e) {
                      return DropdownMenuItem(
                          value: e.fire_id.toString(),
                          child: Text(e.fire_num.toString()));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('error:${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
