import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_toggleButtonVisibility);
    _passwordController.addListener(_toggleButtonVisibility);
  }

  void _toggleButtonVisibility() {
    setState(() {
      _isButtonVisible =
          _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

  void _login() {
    // Add your authentication logic here
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Example: Check if username and password are valid
    if (username == 'user' && password == 'password') {
      // Navigate to the next screen or perform other actions
      print('Login successful!');
    } else {
      // Show an error message or handle authentication failure
      print('Login failed. Please check your credentials.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'usernameField',
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Hero(
              tag: 'passwordField',
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            AnimatedOpacity(
              opacity: _isButtonVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: ElevatedButton(
                onPressed: _isButtonVisible ? _login : null,
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
