import 'package:flutter/material.dart';
// import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {

  FilePickerResult? result;
  var filepath = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Add Product',
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
              // controller: fname,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: '  Food Name ',
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
              // controller: fprice,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                labelText: '  Price',
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
              maxLines: 5,
              style: const TextStyle(color: Colors.blue),
              // controller: details,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: '  Food Ditails',
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
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
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