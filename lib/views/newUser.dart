import 'package:flutter/material.dart';
import 'package:take_away_app/services/userService.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({Key? key}) : super(key: key);

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  final UserService userService = UserService();
  final _formKey = GlobalKey<FormState>();

  var data;
  String? selectedCategory;
  List<String>? categories = [];

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressRestaurantController = TextEditingController();
  final priceController = TextEditingController();
  final distanceController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    labelText: 'username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm the password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }else if (confirmPasswordController.text != passwordController.text){
                      return 'Please make sure your passwords match ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),


                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final newUser = {
                        'login': userNameController.text,
                        'password': passwordController.text,
                       };
                      userService.addUser(newUser);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('Add User'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
