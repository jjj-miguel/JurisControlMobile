import 'package:flutter/material.dart';
import 'package:teste1/About/About.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030430),

    body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo ou ícone principal
             Image.asset("images/Group.png"),
                const SizedBox(height: 30.0),
                const SizedBox(height: 10.0),
                Text(
                  "Faça login para continuar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40.0),

                // Campo de nome de usuário
                TextField(
                  controller: _usernameController,
                  style: TextStyle(
                    color: Colors.white, // Cor do texto digitado
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: "Nome de usuário",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                // Campo de senha
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white, // Cor do texto digitado
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                // Esqueceu a senha
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Lógica para "Esqueceu a senha"
                    },
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                // Botão de login
                ElevatedButton(
                  onPressed: () {
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    if (username.isNotEmpty && password.isNotEmpty) {
                      // Navegar para a página About
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  About()),);
                    } else {
                      // Mostrar erro
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Por favor, preencha os campos.')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Color(0xFF030430)),
                  ),
                ),
                const SizedBox(height: 30.0),

                // Texto para registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Não tem uma conta? ",
                    style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Lógica para redirecionar ao registro
                      },
                      child: Text(
                        "Cadastre-se",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
