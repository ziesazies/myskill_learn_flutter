import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isVisible = true;
  bool _isCheck = false;

  String? selectedBahasa = 'ID';

  List<Map<dynamic, dynamic>> bahasa = <Map<dynamic, dynamic>>[
    <dynamic, dynamic>{'id': 'ID', 'title': 'Bahasa Indonesia'},
    <dynamic, dynamic>{'id': 'EN', 'title': 'English'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Text('Welcome to Login Page'),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                value: selectedBahasa,
                items:
                    bahasa.map<DropdownMenuItem<String>>((
                      Map<dynamic, dynamic> data,
                    ) {
                      return DropdownMenuItem<String>(
                        value: data['id'],
                        child: Text(data['title']),
                      );
                    }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedBahasa = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'abc@mail.com',
                labelText: 'Email',
                border: OutlineInputBorder(),
                icon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: _isVisible ? true : false,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                border: OutlineInputBorder(),
                icon: Icon(Icons.lock),
                suffixIcon: InkWell(
                  child: Icon(
                    _isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Lupa Password', style: TextStyle(color: Colors.blue)),
            SizedBox(height: 30),
            FilledButton(
              onPressed: _isCheck == true ? () {} : null,
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum punya akun?'),
                TextButton(onPressed: () {}, child: Text('Daftar')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _isCheck,
                  onChanged: (value) {
                    setState(() {
                      _isCheck = !_isCheck;
                    });
                  },
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Dengan login dan mendaftar anda telah menyetujui kebijakan privasi dan terms oof condition',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
