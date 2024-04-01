// ignore: depend_on_referenced_packages
// import 'dart:convert';
import 'dart:io';

import 'package:admin_panel/apiService.dart';
import 'package:admin_panel/commonWidget.dart';
import 'package:admin_panel/restaurantData.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// ignore: camel_case_types
class pending extends StatefulWidget {
  const pending({super.key});

  @override
  State<pending> createState() => _pendingState();
}

// ignore: camel_case_types
class _pendingState extends State<pending> {
  ApiService apiService = ApiService();
  CommonWidget commonWidget = CommonWidget();

  TextEditingController pname=TextEditingController();
  TextEditingController ptype=TextEditingController();
  TextEditingController category=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController cookingtime=TextEditingController();

  FilePickerResult? result;
  var filepath = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Add Product',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
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
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: filepath == ''
                              ? Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Select Image",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              : Image.file(
                                  File(filepath),
                                  fit: BoxFit.cover,
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.blue), // Text color
              controller: pname,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: '  Product Name ',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ), // Label text color
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.blue), // Focused border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.blue), // Text color
              controller: ptype,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                labelText: '  Product Type',
                labelStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.blue), // Focused border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              // maxLines: 5,
              style: const TextStyle(color: Colors.blue),
              controller: category,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: '  Category',
                labelStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ), // Label text color
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.blue), // Focused border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              // maxLines: 5,
              style: const TextStyle(color: Colors.blue),
              controller: price,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: '  Price',
                labelStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ), // Label text color
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.blue), // Focused border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              // maxLines: 5,
              style: const TextStyle(color: Colors.blue),
              controller: cookingtime,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: '  Cooking Time',
                labelStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ), // Label text color
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.blue), // Focused border color
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color
              ),
            ),
            SizedBox(height: 20,),
            
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  var resData = Provider.of<RestaurantData>(context, listen: false).getResData();
                  final formData = FormData.fromMap({
                    'rid': resData['resid'],
                    'name': pname.text,
                    'ptype': ptype.text,
                    'category': category.text,
                    'price':price.text,
                    'cookingtime':cookingtime.text,
                    'pimage': await MultipartFile.fromFile(filepath),
                  });
                  var res = await apiService.postCall("add_product.php", formData);
                  if(res['status'] == true){
                    if (mounted) {
                      commonWidget.toastSuccess(context, res['message']);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}