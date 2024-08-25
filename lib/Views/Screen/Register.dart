import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project_login/Views/Screen/Login.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                    "assets/icon_register_stock.png",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome back!",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(92, 96, 239, 1.0)),
                ),
                Text(
                  "Let's Create Your Account",
                  style: TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(92, 96, 239, 1.0)),
                ),
                SizedBox(
                  height: 70,
                ),
                Form(
                  child: Column(
                    children: [
                      _buildTextField(
                          labelText: "Email",
                          iconData: Icons.email,
                          controller: _emailController),
                      SizedBox(
                        height: 20,
                      ),
                      _buildTextField(
                          labelText: "Password",
                          iconData: Icons.password,
                          controller: _passwordController),
                      SizedBox(
                        height: 20,
                      ),
                      _buildTextField(
                          labelText: "Confirm Password",
                          iconData: Icons.password_rounded,
                          controller: _confirmPasswordController),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .7),
                            ])),
                        child: const Center(
                          child: Text("Create Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                          height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Already a User?",
                              style: TextStyle(
                                color:Color.fromRGBO(82, 101, 231, 1.0),
                                fontSize: 18,
                              )
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            }, child: Text(
                            "Login now",
                            style: TextStyle(
                                color: Color.fromRGBO(68, 74, 246, 1.0),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String labelText,
      required IconData iconData,
      required TextEditingController controller,
      String? Function(String?)? validator}) {
      return TextFormField(
        expands: false,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(
              iconData,
              size: 30,
              color: Color.fromRGBO(143, 148, 251, 1),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      );
  }
}
