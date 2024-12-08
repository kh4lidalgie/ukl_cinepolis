import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordHidden = true; // agar password bisa di hidden/unhidden
  bool _isAgreed = false; // untuk checkbox saya setuju

  // Method untuk menghandle login
  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // logika login
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login successful!')));
      // Navigasi ke home page
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Flexible(
              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hai Moviegoers',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(12, 26, 87, 1),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sudah siap merasakan pengalaman menonton yang tidak terlupakan?',
              style: TextStyle(
                  fontSize: 16.0, color: Color.fromRGBO(12, 26, 87, 1)),
            ),
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email or WhatsApp Number',
                      hintText: 'Enter your email or phone number',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email or phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isPasswordHidden,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: _isAgreed,
                        onChanged: (value) {
                          setState(() {
                            _isAgreed = value!;
                          });
                        },
                      ),
                      Text(
                          'Ya, saya menerima syarat dan ketentuan yang berlaku.')
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Forgot password clicked')));
                        },
                        child: Text('Forgot Password?'),
                        style: TextButton.styleFrom(
                          foregroundColor: Color.fromRGBO(12, 26, 87, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color.fromRGBO(12, 26, 87, 1),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                          style: TextStyle(color: Colors.black)),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Navigate to Sign-Up')));
                        },
                        child: Text('Sign Up',
                            style: TextStyle(
                                color: Color.fromRGBO(12, 26, 87, 1))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
