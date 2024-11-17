import 'package:flutter/material.dart';
import 'package:shared_preferans_login/main.dart';
import 'package:shared_preferans_login/pages/home_page.dart';
import 'package:shared_preferans_login/pages/register_page.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool errorText = true;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint(context.toString());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // SvgPicture.asset('assets/icons/logo.svg'),
              const SizedBox(height: 30),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff454B60),
                ),
              ),
              const SizedBox(height: 50),
              errorText
                  ? Text(
                      "Enter your username and password\n to login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: errorText ? const Color(0xff454B60) : Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "Invalid username and / or  password \n Please try again",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: errorText ? const Color(0xff454B60) : Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
              const SizedBox(height: 50),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.contains("@gmail.com")) {
                    return null;
                  } else {
                    return 'Please enter your email address\nExample => (example@gmail.com)';
                  }
                },
              ),
              const SizedBox(height: 30),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  counterText: "Forgot Password?",
                  counterStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff454B60),
                  ),
                  label: Text("Password"),
                  hintStyle: TextStyle(
                    color: Color(0xff454B60),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff454B60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  fixedSize: const Size(double.maxFinite, 55),
                ),
                onPressed: () async {
                  List<String> email = [];
                  List<String> password = [];
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    setState(() {
                      errorText = true;
                    });
                    List<String> xotirada = prefs.getStringList('users') ?? [];
                    for (var o in xotirada) {
                      int slashindex = o.indexOf('/');
                      email.add(o.substring(0, slashindex));
                      password.add(o.substring(slashindex + 1));
                    }

                    debugPrint(email.toString());
                    debugPrint(password.toString());

                    int emailindex = email.indexOf(emailController.text);
                    int passwordindex =
                        password.indexOf(passwordController.text);

                    if (email.contains(emailController.text) &&
                        password.contains(passwordController.text) &&
                        emailindex == passwordindex) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            index: emailindex,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Kiritilgan Email yoki Password noto'g'ri"),
                        ),
                      );
                    }
                  } else {
                    setState(() {});
                    errorText = false;
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Or login in with",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color(0xff454B60),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Color(0xff454B60),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
