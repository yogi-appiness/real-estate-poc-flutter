import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_poc_app/common/string_ext.dart';
import 'package:real_estate_poc_app/pages/login/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  Colors.white,
                  Colors.lightBlue,
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
                "Hello,",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
              const Text(
                "Welcome Back!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 36.0),
                    FormBuilderTextField(
                      name: "email",
                      controller: _emailController,
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
                        if (value == null || value.trim().isEmpty) {
                          return "Email cannot be empty";
                        }

                        if (value.isValidEmail() == false) {
                          return 'Please enter a valid email address';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "password",
                      controller: _passwordController,
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
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter password';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      height: 60.0,
                      width: 240.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            final result = await context
                                .read<LoginProvider>()
                                .loginUser(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim());

                            if (result) {
                              GoRouter.of(context).go("/home");
                            }
                          }
                        },
                        child: const Text("LOGIN",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60.0,
                margin: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 64.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<LoginProvider>().signInWithGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Sign-in with",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 12.0),
                      Image.asset("assets/google_logo.png", height: 32.0),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New User? ", style: TextStyle(fontSize: 16.0)),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).go("/sign-up");
                    },
                    child: const Text(
                      "Sign Up",
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
