import 'package:flutter/material.dart';
import 'package:gns_app/dashboard/Home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: GoogleFonts.openSans(fontSize: 19),
                  decoration: InputDecoration(
                      hintText: 'Enter your email address',
                      label: const Text('Email Address'),
                      labelStyle: GoogleFonts.poppins(fontSize: 22),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email address";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                  style: GoogleFonts.openSans(fontSize: 19),
                  obscureText: _isObsecure,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    label: const Text('Password'),
                    labelStyle: GoogleFonts.poppins(fontSize: 20),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObsecure = !_isObsecure;
                          });
                        },
                        icon: Icon(_isObsecure
                            ? Icons.visibility
                            : Icons.visibility_off_outlined)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
                GestureDetector(
                  child: Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Continue',
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.white)),
                      ],
                    ),
                  ),
                  onTap: () => {
                    if (_formKey.currentState!.validate())
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Logged in successfully'),
                          ),
                        ),
                        Get.to(() => const Home())
                      }
                    else
                      {}
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              ],
            )),
      ),
    );
  }
}
