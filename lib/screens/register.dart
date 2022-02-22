import 'package:flutter/material.dart';
import 'package:seconds/screens/login.dart';
import 'package:http/http.dart' as http;
import 'package:seconds/screens/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final username = TextEditingController();
  final password = TextEditingController();
  final age = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 170,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  color: const Color(0xFF3A5998),
                  child: const Text(
                    "Seconds Company",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                // ignore: sized_box_for_whitespace
                child: Container(
                  child: TextField(
                    controller: username,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    showCursor: false,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'Username'),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),

              // age
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: TextField(
                    controller: age,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    showCursor: false,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'Age'),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 2),

              Align(
                alignment: Alignment.center,
                child: Container(
                  child: TextField(
                    controller: phone,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    showCursor: false,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'Phone Number'),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 2),

              Align(
                alignment: Alignment.center,
                child: Container(
                  child: TextField(
                    controller: email,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    showCursor: false,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'Email'),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 2),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: TextField(
                    controller: password,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    showCursor: false,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'password'),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF4E6AA2),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextButton(
                    onPressed: () async {
                      // ignore: constant_identifier_names, prefer_const_declarations
                      final loginUrl =
                          'http://userbackend.pythonanywhere.com/api/register';
                      final response =
                          await http.post(Uri.parse(loginUrl), body: {
                        'first_name': age.text,
                        'last_name': phone.text,
                        'username': username.text,
                        'email': email.text,
                        'password': password.text,
                      });
                      if (response.statusCode == 200) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text('Account Registered'),
                            );
                          },
                        );
                        await Future.delayed(const Duration(seconds: 3));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Home()));
                      } else {
                        try {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('Error Occured'),
                                );
                              });
                          print(response.statusCode);
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFDDE8F2),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Container(
                  color: const Color(0xFF3A5998),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
