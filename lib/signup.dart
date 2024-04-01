import 'package:admin_panel/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController userName=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Resturant Sign UP",
                style: TextStyle(color: Colors.red, fontSize: 22),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.blue), // Text color
              controller: userName,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                labelText: '  User Name ',
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
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.blue), // Text color
              controller: name,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                labelText: '  Resturant Name ',
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
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.blue), // Text color
              controller: address,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                labelText: ' Resturant Address ',
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
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.blue), // Text color
              controller: phone,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                labelText: ' Resturant Phone ',
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
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.blue), // Text color
              controller: password,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                labelText: '  Password ',
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
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.blue), // Text color
              controller: confirmPassword,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                labelText: '  Confirm Password ',
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: double.infinity,
            child: OutlinedButton(onPressed: () {}, child: const Text("Sign UP")),
          ),
         const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("OR")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("I Have Already A Account. "),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Login(),), (route) => false);
                },
                child : const Text("Back To Login"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
