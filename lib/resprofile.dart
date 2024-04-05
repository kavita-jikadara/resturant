// ignore_for_file: camel_case_types

import 'dart:developer';

import 'package:admin_panel/apiService.dart';
import 'package:admin_panel/editrestaunrant.dart';
import 'package:admin_panel/facilityscreen.dart';
import 'package:admin_panel/loginscreen.dart';
import 'package:admin_panel/menuscreen.dart';
import 'package:admin_panel/photoscreen.dart';
import 'package:admin_panel/restaurantData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  ApiService apiService = ApiService();
  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
  var resData = {};
  bool loader = true;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    log('resData ${Provider.of<RestaurantData>(context, listen: false).resData}');
    resData = Provider.of<RestaurantData>(context, listen: false).getResData();
    // var res = await apiService.getCall('fetch_restrant.php?res_id=10');
    setState(() {
      loader = false;
      // resData = res['data'];
      log('resData $resData');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Restaurant Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton<int>(
            splashRadius: 20,
            elevation: 0,
            iconColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            // padding: EdgeInsets.all(1),
            color: Color.fromARGB(255, 241, 236, 236),
            key: _key,
            itemBuilder: (context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => editprofile(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text('Edit Profile'),
                        // Icon(Icons.edit)
                      ],
                    ),
                    value: 0),
                // PopupMenuItem(
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => facility(),
                //         ),
                //       );
                //     },
                //     child: Row(
                //       children: [
                //         Text('Add Facility'),
                //         // Icon(Icons.edit)
                //       ],
                //     ),
                //     value: 1),
                // PopupMenuItem(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => photoscreen()),
                //     );
                //   },
                //   child: Row(
                //     children: [Text("Add Photo")],
                //   ),
                //   value: 2,
                // ),
                // PopupMenuItem(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => menuscreen()),
                //     );
                //   },
                //   child: Row(
                //     children: [Text("Add Menu")],
                //   ),
                //   value: 3,
                // ),
                PopupMenuItem(
                  child: Text('Logout'),
                  value: 4,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ];
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 243, 243),
      body: loader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          // child: Image.asset('assets/images/res.jpg', fit: BoxFit.fill,),
                          child: resData['resimage'] == ""
                              ? Image.asset(
                                  'assets/images/res.jpg',
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  "${apiService.url}/${resData['resimage']}",
                                  fit: BoxFit.fill,
                                )
                          // Image.asset(
                          //   'assets/images/res.jpg',
                          //
                          // ),
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Text(
                          "Restaurant Name:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${resData['resname']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  // Divider(height: 10,),
                  const Divider(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Text(
                          "Address:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${resData['resaddress']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Text(
                          "Open Time:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${resData['opentime'] == '' ? '-' : resData['opentime']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Text(
                          "Close Time:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${resData['closetime'] == '' ? '-' : resData['closetime']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        const Text(
                          "Phone No:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${resData['resphone']}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Text(
                          "category:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${resData['foodcategory']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Text(
                          "Minimum Amount:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${resData['minamount']} for tow person",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                ],
              ),
            ),
    );
  }
}
