import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UTB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0056A6),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0056A6),
          secondary: Color(0xFF61B33B),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Arial'),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String correctUsername = "UTB";
  final String correctPassword = "123";

  String message = "";

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    setState(() {
      if (username.isEmpty || password.isEmpty) {
        message = "Username dan password tidak boleh kosong!";
      } else if (username != correctUsername) {
        message = "Username tidak terdaftar!";
      } else if (password != correctPassword) {
        message = "Password tidak sesuai!";
      } else {
        message = "Berhasil login!";
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/utb_logo.jpg",
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                "LOGIN AKADEMIK UTB",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0056A6),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon:
                      const Icon(Icons.person, color: Color(0xFF0056A6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFF0056A6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF61B33B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: message == "Berhasil login!"
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page UTB"),
        centerTitle: true,
        backgroundColor: const Color(0xFF0056A6),
      ),
      body: const Center(
        child: Text(
          "Selamat Datang di Aplikasi UTB!",
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Arial',
            color: Color(0xFF0056A6),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
