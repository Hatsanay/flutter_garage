import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_garage/constans.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> garage;
  final String username;

  final String id;

  final String proflie;
  DetailPage(
      {Key? key,
      required this.garage,
      required String title,
      required this.username,
      required this.proflie,
      required this.id})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _like = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      " ",
                      style: TextStyle(fontSize: 25, color: kPrimaryColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "ผู้แจ้ง : ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: kgarage,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqfullname'],
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 1, color: kPrimaryColor), //ว่าง
                ),

                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "เบอร์โทร: ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqtel'],
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 3, color: kPrimaryColor), //ว่าง
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "ปัญหา: ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqproblem'],
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 3, color: kPrimaryColor), //ว่าง
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "รายละเอียดรถ : ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqcardetial'],
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 3, color: kPrimaryColor), //ว่าง
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "เพิ่มเติม : ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqspecial'],
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 3, color: kPrimaryColor), //ว่าง
                ),
                // Row(
                //   children: [
                //     Row(
                //       children: [
                //         Text(
                //           "ระยะห่าง: ",
                //           style: TextStyle(fontSize: 20, color: kPrimaryColor),
                //         ),
                //         Container(
                //           decoration: new BoxDecoration(
                //               color: Colors.white,
                //               borderRadius: new BorderRadius.all(
                //                   new Radius.circular(5.0))),
                //           child: Text(
                //             // distance == null ? ' ' : '$distanceString ก.ม.',
                //             '$distanceString ก.ม.',
                //             style:
                //                 TextStyle(fontSize: 20, color: kPrimaryColor),
                //           ),
                //         )
                //       ],
                //     ),
                //   ],
                // ),
                Text(
                  'แก้ไขสถานะ',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20),
                ),
                DropdownButton<int>(
                  items: [
                    DropdownMenuItem(
                      child: Text('ปฎิเสธ'),
                      value: 9,
                    ),
                    DropdownMenuItem(
                      child: Text('รอยืนยัน'),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text('กำลังเตรียมพร้อม'),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text('กำลังเดินทาง'),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text('กำลังดำเนินการซ่อม'),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text('เสร็จสิ้น'),
                      value: 5,
                    ),
                  ],
                  onChanged: (value) async {
                    var url = Uri.http("192.168.1.106",
                        '/flutter_garage/update_repair_status.php');
                    var response = await http.post(url, body: {
                      'action': 'update_repair_status',
                      'repair_id': widget.garage['repairreqid'].toString(),
                      'repair_status': value.toString(),
                    });
                    if (response.statusCode == 200) {
                      var data = json.decode(response.body);
                      if (data['status'] == 'success') {
                        setState(() {
                          widget.garage['repairreqstatus'] = value;
                        });
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: Text('Status updated successfully'),
                        // ));
                        Fluttertoast.showToast(
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          msg: 'อัพเดทสถานะเสร็จสิ้น',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      } else {
                        //   Scaffold.of(context).showSnackBar(SnackBar(
                        //     content: Text('Failed to update status'),
                        //   ));
                        Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          msg: 'อัพเดทสถานะไม่สำเร็จ',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      }
                    } else {
                      // Scaffold.of(context).showSnackBar(SnackBar(
                      //   content: Text('Failed to update status'),
                      // ));
                      Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        msg: 'อัพเดทสถานะไม่สำเร็จ ERROR',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
