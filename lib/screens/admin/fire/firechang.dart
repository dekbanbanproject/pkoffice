import 'package:flutter/material.dart';
import 'package:pkoffice/models/firelistmodel.dart';

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
  }

  Future<>

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
    );
  }
}
