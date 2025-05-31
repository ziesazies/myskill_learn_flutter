import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Login Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          Text('Welcome to Login Page'),
          SizedBox(height: 10),
          TextField(controller: _emailController),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Text('Lupa Password', style: TextStyle(color: Colors.blue)),
          SizedBox(height: 30),
          FilledButton(onPressed: () {}, child: Text('Login')),
          SizedBox(height: 20),
          Row(
            children: [
              Text('Belum punya akun?'),
              TextButton(onPressed: () {}, child: Text('Daftar')),
            ],
          ),
        ],
      ),
    );
  }
}
