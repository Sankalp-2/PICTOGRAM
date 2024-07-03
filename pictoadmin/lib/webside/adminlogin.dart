import 'package:flutter/material.dart';
import 'package:pictoadmin/utils/colors.dart';
import 'package:pictoadmin/webside/homepage.dart';
import 'package:pictoadmin/widgets/text_field_input.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Add your logic to validate the email and password
    String email = 'admin@gmail.com';
    String password = 'ad123';

    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AdminDashboardPage()),
      );
    } else {
      // Show error message or handle invalid input
      print('Please enter valid email and password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PICTOGRAM',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 7, 245, 229),
                letterSpacing: 1.5,
                wordSpacing: 2,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'ADMIN LOGIN',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 170, 24, 228),
                letterSpacing: 1.5,
                wordSpacing: 2,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter your password',
              textInputType: TextInputType.text,
              textEditingController: _passwordController,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                if (!_isLoading) {
                  loginUser();
                }
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color:
                      blueColor, // Assuming blueColor is defined in your colors file
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color:
                            primaryColor, // Assuming primaryColor is defined in your colors file
                      )
                    : const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
