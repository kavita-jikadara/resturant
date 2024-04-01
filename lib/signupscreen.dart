
import 'package:admin_panel/apiService.dart';
import 'package:admin_panel/loginscreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ApiService apiService = ApiService();
  
  final _formfield = GlobalKey<FormState>();
  final userController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final pwdController = TextEditingController();
  final cpwdController = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Get Started",style: TextStyle(color: Color.fromARGB(255, 122, 14, 8),fontWeight: FontWeight.w600,fontSize: 26),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/image.png",
                  height: 200,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blue), // Text color
                    controller: userController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: '  User Name ',
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ), // Label text color
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue), // Border color
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
                        Icons.person_add_alt_outlined,
                        size: 22,
                        color: Color.fromARGB(255, 125, 125, 125),
                      ),
                  
                      filled: true,
                      fillColor: Colors.grey[200], // Background color
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter username"; // Return a message when the field is empty
                      }
                      return null; // Return null when the input is valid
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blue), // Text color
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: ' Resturant Name ',
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ), // Label text color
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue), // Border color
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
                        Icons.room_service_outlined,
                        size: 22,
                        color: Color.fromARGB(255, 125, 125, 125),
                      ),
                  
                      filled: true,
                      fillColor: Colors.grey[200], // Background color
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Resturant name"; // Return a message when the field is empty
                      }
                      return null; // Return null when the input is valid
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blue), // Text color
                    controller: addressController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: ' Resturant Address ',
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ), // Label text color
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue), // Border color
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
                        Icons.location_on_sharp,
                        size: 22,
                        color: Color.fromARGB(255, 125, 125, 125),
                      ),
                  
                      filled: true,
                      fillColor: Colors.grey[200], // Background color
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Resturant address"; // Return a message when the field is empty
                      }
                      return null; // Return null when the input is valid
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blue),
                    keyboardType: TextInputType.phone, // Text color
                    controller: phoneController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: ' Resturant Phone ',
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ), // Label text color
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue), // Border color
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
                        Icons.call,
                        size: 22,
                        color: Color.fromARGB(255, 125, 125, 125),
                      ),
                  
                      filled: true,
                      fillColor: Colors.grey[200], // Background color
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Resturant Phone number"; // Return a message when the field is empty
                      }
                      return null; // Return null when the input is valid
                    },
                  ),
                ),
                 Container(
                  margin: const EdgeInsets.all(10),
                   child: TextFormField(
                    style: const TextStyle(color: Colors.blue), // Text color
                    controller: pwdController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0.0),
                    labelText: '  Password ',
                    border: const OutlineInputBorder(),
                    
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
                    prefixIcon: const Icon(Icons.lock,size: 22,color: Color.fromARGB(255, 125, 125, 125),),
                    suffix: Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        onTap: () {
                   
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        
                        child: Icon(passToggle ? Icons.visibility : Icons.visibility_off,color: Colors.grey,),
                      ),
                    ),  
                    filled: true,
                    fillColor: Colors.grey[200], // Background color
                          ),
                     validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter password"; // Return a message when the field is empty
                      }
                      return null; // Return null when the input is valid
                    },
                     ),
                  ),
                  Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blue), // Text color
                    controller: cpwdController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: '  Confirm Password ',
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ), // Label text color
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue), // Border color
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blue), // Focused border color
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                     prefixIcon: const Icon(Icons.lock,size: 22,color: Color.fromARGB(255, 125, 125, 125),),
                     suffix: Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        onTap: () {
                   
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        
                        child: Icon(passToggle ? Icons.visibility : Icons.visibility_off,color: Colors.grey,),
                      ),
                    ),                   
                      filled: true,
                      fillColor: Colors.grey[200], // Background color
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter confirm password"; // Return a message when the field is empty
                      }
                      return null; // Return null when the input is valid
                    },
                  ),
                ),
                 const SizedBox(height: 20,),
                  InkWell(
                    onTap: () async{
                      if(_formfield.currentState!.validate()){
                        //  print("success");
                        // userController.clear();
                        // nameController.clear();
                        // addressController.clear();
                        // phoneController.clear();                        
                        // pwdController.clear();
                        // cpwdController.clear();
                        final formData = FormData.fromMap({
                          'res_user_name': userController.text,
                          'resname': nameController.text,
                          'resaddress': addressController.text,
                          'resphone': phoneController.text,
                          'res_password': pwdController.text,
                          // 'res_cpwd': cpwdController.text,
                        });
                        var res = await apiService.postCall("add_restaurant.php", formData);
                       
                       if(res['status'] == true){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                       }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?",style: TextStyle(fontSize: 16),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      }, child: const Text("Sign In",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.indigo),),),
                    ],
                  ),
                 const SizedBox(height: 80,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}