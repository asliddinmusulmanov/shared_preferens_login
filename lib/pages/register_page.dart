import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferans_login/main.dart';
import 'package:shared_preferans_login/pages/login_page.dart';

TextEditingController emailtextEditingController = TextEditingController();
TextEditingController passwordtextEditingController = TextEditingController();
TextEditingController passwordConfirmtextEditingController =
    TextEditingController();
TextEditingController mobiletextEditingController = TextEditingController();

List<String> users = [];

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

bool isnima = true;

bool errorEmailAddress = true;

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    debugPrint(context.toString());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: globalKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xff454B60),
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Enter your details to register",
                    style: TextStyle(
                      color: Color(0xff454B60),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      counterStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff454B60),
                      ),
                      label: Text("Name"),
                      hintStyle: TextStyle(
                        color: Color(0xff454B60),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return 'Please enter your name';
                      }
                    },
                    onChanged: (value) {
                      if (globalKey.currentState!.validate()) {
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailtextEditingController,
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
                    onChanged: (value) {
                      if (globalKey.currentState!.validate()) {
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  IntlPhoneField(
                    controller: mobiletextEditingController,
                    validator: (value) {
                      if (value.toString().isNotEmpty) {
                        return null;
                      } else {
                        return "Enter your phone number";
                      }
                    },
                    onChanged: (value) {
                      if (globalKey.currentState!.validate()) {
                        setState(() {});
                      }
                    },
                    initialCountryCode: "UZ",
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: isnima,
                    controller: passwordtextEditingController,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          isnima = !isnima;
                          setState(() {});
                        },
                        icon: isnima
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      label: const Text("Enter your password"),
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                    ),
                    validator: (value) {
                      RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                      if (value != null && value.contains(regex)) {
                        return null;
                      } else {
                        return 'Must be 8 or more characters  and contain at least 1\nnumber or special character';
                      }
                    },
                    onChanged: (value) {
                      if (globalKey.currentState!.validate()) {
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordConfirmtextEditingController,
                    validator: (value) {
                      if (value == passwordtextEditingController.text) {
                        return null;
                      } else {
                        return "The verification password is incorrect";
                      }
                    },
                    onChanged: (value) {
                      if (globalKey.currentState!.validate()) {
                        setState(() {});
                      }
                    },
                    decoration: const InputDecoration(
                      counterStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff454B60),
                      ),
                      label: Text("Confirm Password"),
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
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff454B60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      fixedSize: const Size(double.maxFinite, 55),
                    ),
                    onPressed: () async {
                      var natija = globalKey.currentState!.validate();
                      if (natija &&
                          mobiletextEditingController.text
                              .toString()
                              .isNotEmpty) {
                        //model
                        String model =
                            '${emailtextEditingController.text}/${passwordtextEditingController.text}';
                        //listga qo'shildi
                        users.add(model);
                        //xot olindi
                        List<String> data = prefs.getStringList('users') ?? [];
                        //xot o'chirildi
                        prefs.clear();
                        //listga xot joy
                        users.addAll(data);
                        // xot olinga o'chorildi
                        data.clear();
                        await prefs.setStringList('users', users);
                        users.clear();
                        debugPrint(data.toString());
                        debugPrint(prefs.toString());
                        debugPrint(users.toString());

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                        List<String> oxirgi =
                            prefs.getStringList('users') ?? [];
                        debugPrint('Xotirada : $oxirgi');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Ma`lumotlarni to'liq to`ldiring"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Need help? Visit our",
                        style: TextStyle(
                          color: Color(0xff454B60),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
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
        ),
      ),
    );
  }
}
