import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.green,
                  Colors.white,
                ],
              ),
            ),
          ),
          ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            children: [
              const SizedBox(height: 48.0),
              const Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
              FormBuilder(
                child: Column(
                  children: [
                    const SizedBox(height: 36.0),
                    FormBuilderTextField(
                      name: "full_name",
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        labelText: 'Full Name',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter name';
                        return null;
                      },
                    ),
                    const SizedBox(height: 36.0),
                    FormBuilderTextField(
                      name: "email",
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        labelText: 'E-mail',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) return 'Your email';
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "password",
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        labelText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none),
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (obscurePassword == false) {
                              setState(() => obscurePassword = true);
                            } else {
                              setState(() => obscurePassword = false);
                            }
                          },
                          icon: obscurePassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                      obscureText: obscurePassword,
                      validator: (value) {
                        if (value!.isEmpty) return 'Your password';
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "cnf_password",
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        labelText: 'Confirm Password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none),
                      ),
                      obscureText: obscurePassword,
                      validator: (value) {
                        if (value!.isEmpty) return 'Your password';
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      height: 60.0,
                      width: 240.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("SIGN UP",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Registered? ",
                      style: TextStyle(fontSize: 16.0)),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).go("/login");
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
