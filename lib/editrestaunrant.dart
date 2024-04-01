import 'dart:developer';
import 'dart:io';

import 'package:admin_panel/apiService.dart';
import 'package:admin_panel/commonWidget.dart';
import 'package:admin_panel/restaurantData.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  FilePickerResult? result;
  var filepath = '';
  ApiService apiService = ApiService();
  CommonWidget commonWidget = CommonWidget();
  var resData = {};
  bool loader = true;

  TextEditingController resName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController openTime = TextEditingController();
  TextEditingController closeTime = TextEditingController();
   TextEditingController phone = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController minimumAmount = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    resData = Provider.of<RestaurantData>(context, listen: false).getResData();
    setState(() {
      loader = false;
      resName.text = resData['resname'];
      address.text = resData['resaddress'];
      openTime.text = resData['opentime'];
      closeTime.text = resData['closetime'];
      phone.text = resData['resphone'];
      category.text = resData['foodcategory'];
      minimumAmount.text = resData['minamount'];
      log('resData $resData');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              if (filepath.isNotEmpty) {
                final formData = FormData.fromMap({
                  'resid': resData['resid'],
                  'resname': resName.text,
                  'resaddress': address.text,
                  'opentime': openTime.text,
                  'closetime': closeTime.text,
                  'resphone': phone.text,
                  'foodcategory': category.text,
                  'minamount': minimumAmount.text,
                  'resimage': await MultipartFile.fromFile(filepath),
                });
                var res =
                    await apiService.postCall("update_restarunt.php", formData);
                if (res['status'] == true) {
                  if (mounted) {
                    Provider.of<RestaurantData>(context, listen: false)
                        .setResData(res['data']);
                    commonWidget.toastSuccess(context, res['message']);
                  }
                }
              } else {
                final formData = FormData.fromMap({
                  'resid': resData['resid'],
                  'resname': resName.text,
                  'resaddress': address.text,
                  'opentime': openTime.text,
                  'closetime': closeTime.text,
                  'resphone': phone.text,
                  'foodcategory': category.text,
                  'minamount': minimumAmount.text,
                });
                var res =
                    await apiService.postCall("update_restarunt.php", formData);
                if (res['status'] == true) {
                  if (mounted) {
                    Provider.of<RestaurantData>(context, listen: false)
                        .setResData(res['data']);
                    commonWidget.toastSuccess(context, res['message']);
                  }
                }
              }
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.upload,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: loader
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () async {
                        result = await FilePicker.platform
                            .pickFiles(type: FileType.image);
                        if (result == null) {
                          return null;
                        } else {
                          setState(() {
                            result?.files.forEach(
                              (element) {
                                filepath = element.path!;
                              },
                            );
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10), // height: 150,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: filepath == ''
                                  ? Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: resData['resimage'] == ""
                                          ? const Center(
                                              child: Text(
                                                "Select Image",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          : Image.network(
                                              "${apiService.url}/${resData['resimage']}",
                                              fit: BoxFit.fill,
                                            ),
                                    )
                                  : SizedBox(
                                      height: 150,
                                      child: Image.file(
                                        File(filepath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                filepath = '';
                              });
                            },
                            child: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.blue), // Text color
                      controller: resName,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: '  Restaurant Name',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ), // Label text color
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Focused border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.blue), // Text color
                      controller: address,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: '  Address',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ), // Label text color
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Focused border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.blue), // Text color
                      controller: openTime,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: '  Open Time',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ), // Label text color
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Focused border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.blue), // Text color
                      controller: closeTime,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: '  Close Time',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ), // Label text color
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Focused border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.blue), // Text color
                      controller: phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: '  Phone No',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ), // Label text color
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Focused border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.blue), // Text color
                      controller: category,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: '  category',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ), // Label text color
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Focused border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.blue), // Text color
                      controller: minimumAmount,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: '  Minimum Amount',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ), // Label text color
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue), // Focused border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
