import 'package:admin_panel/apiService.dart';
import 'package:admin_panel/commonWidget.dart';
import 'package:admin_panel/restaurantData.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class facility extends StatefulWidget {
  const facility({super.key});

  @override
  State<facility> createState() => _facilityState();
}

class _facilityState extends State<facility> {
  ApiService apiService = ApiService();
  CommonWidget commonWidget = CommonWidget();
  
   final _formfield = GlobalKey<FormState>();
   TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Add Facilities',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
     body: SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(10),
      child: Form(
        key: _formfield,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 20,
                    style: const TextStyle(color: Colors.blue), // Text color
                    controller: name,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: '  Enter Facilities ',
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
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
                      prefixIcon: const Icon(
                        Icons.accessibility_new_outlined,
                        size: 22,
                        color: Color.fromARGB(255, 125, 125, 125),
                      ),

                      filled: true,
                      fillColor: Colors.grey[200], // Background color
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Facility"; // Return a message when the field is empty
                      }
                      return null; // Return null when the input is valid
                    },
                  ),
                ),    
            const SizedBox(
              height: 10,
            ),
           SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  var resData = Provider.of<RestaurantData>(context, listen: false).getResData();
                  final formData = FormData.fromMap({
                    'rid': resData['resid'],
                    'textfield': name.text,          
                  });
                  var res = await apiService.postCall("add_facilitie.php", formData);
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
        )
      ),
      ),
     ),
    );
  }
}