import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      label: const Text('Full Name'),
                      labelStyle: GoogleFonts.poppins(fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your fullname";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        label: const Text('Email Address'),
                        labelStyle: GoogleFonts.poppins(fontSize: 18),
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
                    decoration: InputDecoration(
                      hintText: 'Contact Number',
                      label: const Text('Contact Number'),
                      labelStyle: GoogleFonts.poppins(fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your contact number";
                      }
                      return null;
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      label: const Text('Password'),
                      labelStyle: GoogleFonts.poppins(fontSize: 18),
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
                          Text('Sign Up',
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
                              content: Text('Registered successfully'),
                            ),
                          )
                        }
                      else
                        {}
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                ],
              )),
        ),
      ),
    );
  }
}
