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
class photoscreen extends StatefulWidget {
  const photoscreen({super.key});

  @override
  State<photoscreen> createState() => _photoscreenState();
}

// ignore: camel_case_types
class _photoscreenState extends State<photoscreen> {
  ApiService apiService = ApiService();
  CommonWidget commonWidget = CommonWidget();

   TextEditingController pname=TextEditingController();
  

  FilePickerResult? result;
  var filepath = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Add Photo',
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
                        height: 200,
                        width: 300,
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
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.blue), // Text color
              controller: pname,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),                 
                labelText: '  Enater a Photo Tag ',
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
                prefixIcon: const Icon(Icons.label_outlined,size: 22,color: Color.fromARGB(255, 125, 125, 125),),
                filled: true,
                fillColor: Colors.grey[200], // Background color
              ),
            ),
            const SizedBox(
              height: 10,
            ),
           
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  var resData = Provider.of<RestaurantData>(context, listen: false).getResData();
                  final formData = FormData.fromMap({
                    'rid': resData['resid'],
                    'tagname': pname.text,          
                    'image': await MultipartFile.fromFile(filepath),
                  });
                  var res = await apiService.postCall("add_photo.php", formData);
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