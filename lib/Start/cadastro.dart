import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
   CadastroScreen({super.key});

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();

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
                
                Image.asset("images/Group.png"),
                const SizedBox(height: 30.0),
                const SizedBox(height: 10.0),
                Text(
                  "Faça seu cadastro para continuar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40.0),

                
                TextField(
                  controller: _nomeController,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: "Nome",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                
                TextField(
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                
                TextField(
                  controller: _cpfController,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: "CPF ou CNPJ",
                    prefixIcon: Icon(Icons.assignment),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                
                TextField(
                  controller: _senhaController,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white, 
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

                
                TextField(
                  controller: _confirmarSenhaController,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: "Confirmar senha",
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                
                ElevatedButton(
                  onPressed: () {
                    String nome = _nomeController.text;
                    String email = _emailController.text;
                    String cpf = _cpfController.text;
                    String senha = _senhaController.text;
                    String confirmarSenha = _confirmarSenhaController.text;

                    if (nome.isNotEmpty &&
                        email.isNotEmpty &&
                        cpf.isNotEmpty &&
                        senha.isNotEmpty &&
                        confirmarSenha.isNotEmpty &&
                        senha == confirmarSenha) {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Cadastro realizado com sucesso!')),
                      );
                    } else {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Por favor, preencha todos os campos corretamente!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 18, color: Color(0xFF030430)),
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
