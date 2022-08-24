import 'package:code4odisha/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email;
  late String password;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  bool hiddenPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputborder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: Divider.createBorderSide(
        context,
        width: 1.0,
        color: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    'images/Code4Odisha.svg',
                    height: 200.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Form(
                key: loginKey,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Enter Your Email",
                          labelStyle: TextStyle(color: Colors.white),
                          border: inputborder,
                          focusedBorder: inputborder,
                          enabledBorder: inputborder,
                          filled: false,
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please Enter an Email',
                                ),
                                duration: Duration(milliseconds: 1000),
                              ),
                            );
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value!)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please Enter a Valid Email',
                                ),
                                duration: Duration(milliseconds: 1000),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Enter Your Password",
                          labelStyle: TextStyle(color: Colors.white),
                          border: inputborder,
                          focusedBorder: inputborder,
                          enabledBorder: inputborder,
                          filled: false,
                          contentPadding: const EdgeInsets.all(8),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                hiddenPassword = !hiddenPassword;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        keyboardType: TextInputType.text,
                        obscureText: hiddenPassword,
                        validator: (value) {
                          if (value!.length < 6) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Password Too short',
                                ),
                                duration: Duration(milliseconds: 1000),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () async {
                          if (loginKey.currentState!.validate()) {
                            if (email.isNotEmpty && password.isNotEmpty) {
                              await HttpService.login(email, password, context);
                            }
                          }
                        },
                        child: Container(
                          width: 100.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            color: Colors.orangeAccent,
                          ),
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              title: Text('Support'),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Team Number',
                                          icon: Icon(Icons.numbers),
                                        ),
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Your Name',
                                          icon: Icon(Icons.account_box),
                                        ),
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Issue',
                                          icon: Icon(Icons.help),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      // minimumSize: Size(1,3),
                                      primary: Colors.amber.shade900,
                                      onPrimary: Colors.white,
                                    ),
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      // your code
                                    })
                              ],
                            );
                          });
                    },
                    style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: const Text(
                      "?",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
