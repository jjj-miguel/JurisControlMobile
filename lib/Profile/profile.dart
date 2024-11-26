import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  // Controladores
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfCnpjController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Dados de exemplo para o perfil
    _nomeController.text = "Pedro Matsushita";
    _emailController.text = "pedro.matsushita@email.com";
    _cpfCnpjController.text = "123.456.789-00";
    _senhaController.text = "123456";
    _enderecoController.text = "Rua Guarani, 123 - Recife";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF030430),
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    _buildTextField(
                      controller: _nomeController,
                      label: "Nome",
                      enabled: _isEditing,
                      readOnly: !_isEditing,
                      validator: (value) =>
                          value?.isEmpty ?? true ? "Nome é obrigatório" : null,
                    ),
                    _buildTextField(
                      controller: _emailController,
                      label: "Email",
                      enabled: _isEditing,
                      readOnly: !_isEditing,
                      validator: (value) => value?.contains("@") ?? false
                          ? null
                          : "Insira um email válido",
                    ),
                    _buildTextField(
                      controller: _cpfCnpjController,
                      label: "CPF/CNPJ",
                      enabled: _isEditing,
                      readOnly: !_isEditing,
                      validator: (value) => value?.isEmpty ?? true
                          ? "CPF/CNPJ é obrigatório"
                          : null,
                    ),
                    _buildTextField(
                      controller: _senhaController,
                      label: "Senha",
                      enabled: _isEditing,
                      readOnly: !_isEditing,
                      obscureText: true,
                      validator: (value) => value != null && value.length >= 6
                          ? null
                          : "A senha deve ter pelo menos 6 caracteres",
                    ),
                    _buildTextField(
                      controller: _enderecoController,
                      label: "Endereço",
                      enabled: _isEditing,
                      readOnly: !_isEditing,
                      validator: (value) => value?.isEmpty ?? true
                          ? "Endereço é obrigatório"
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _isEditing
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    setState(() {
                      _isEditing = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Informações salvas com sucesso!")));
                  }
                },
                backgroundColor: Color(0xFF030430),
                child: const Text(
                  "Confirmar",
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 6.0,
                mini: true,
              ))
          : null,
      floatingActionButton: _isEditing
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
              backgroundColor: Color(0xFF030430),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
    );
  }

  // Parte de edição
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool enabled = true,
    bool readOnly = false,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        readOnly: readOnly,
        obscureText: obscureText,
        style: TextStyle(color: Colors.black, fontSize: 18.0),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontSize: 18.0),
          filled: !readOnly,
          fillColor: readOnly ? Colors.grey[100] : Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color(0xFF030430),
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color(0xFF030430),
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
