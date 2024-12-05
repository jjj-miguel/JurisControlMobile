import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste1/About/About.dart';
import 'package:teste1/Start/cadastro.dart';

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

  Future<void> loginUser(BuildContext context) async {
    final String email = _usernameController.text;
    final String senha = _passwordController.text;

    if (email.isNotEmpty && senha.isNotEmpty) {
      // URL da API e Token
      final String apiUrl = 'https://api.baserow.io/api/database/rows/table/402640/?user_field_names=true';
      final String apiToken = 'mK1hTBbMzDoQFHMcupCEDVg4ctfIPjF7';

      try {
        final response = await http.get(
          Uri.parse('$apiUrl&filter_field=Email&filterfield_value=$email&filterfield=Senha&filter_field_value=$senha'),
          headers: {
            'Authorization': 'Token $apiToken',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login realizado com sucesso!')),
            );
            // Navegar para a página About
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => About()),);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Credenciais inválidas! Tente novamente.')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro no servidor. Tente novamente mais tarde.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao se conectar com o servidor.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
    }
  }

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
                const Text(
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
                  style: const TextStyle(
                    color: Colors.white, // Cor do texto digitado
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: "E-mail",
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
                  style: const TextStyle(
                    color: Colors.white, // Cor do texto digitado
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: "Senha",
                    prefixIcon: const Icon(Icons.lock),
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
                    child: const Text(
                      "Esqueceu a senha?",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                // Botão de login
                ElevatedButton(
                  onPressed: () => loginUser(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Color(0xFF030430)),
                  ),
                ),
                const SizedBox(height: 30.0),

                // Texto para registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Não tem uma conta? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  CadastroScreen()),);
                      },
                      child: const Text(
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