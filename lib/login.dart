import 'package:admin_panel/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
final userController = TextEditingController();
  final pwdController = TextEditingController();
  bool passToggle = true;

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,  
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login", style: TextStyle(color: Colors.red, fontSize: 22),),
                ],
              ),
            ],
          ),
          Form(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                      style: const TextStyle(color: Colors.blue), // Text color
                       controller: userController,
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
                        prefixIcon: const Icon(Icons.person_add_alt_outlined,size: 22,color: Color.fromARGB(255, 125, 125, 125),),
                        
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                      ),
                     validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter password"; // Return a message when the field is empty
                              }
                              return null; // Return null when the input is valid
                            },
                    ),
                ),
              ],
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
              ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
              
              }, 
            child: const Text("Login")),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Already have an account?")
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup(),));
            },
            child: InkWell(
              onTap: () {
                
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: const Text("Sign Up")
              ),
            ),
          ),
        ],
      ),
    );
  }
}