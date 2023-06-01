import 'package:flutter/material.dart';
import '../api.dart';
import '../models/userModel.dart';
import 'dashboard.dart';
import '../services/userService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final storage = new FlutterSecureStorage();
  final _formKey = GlobalKey<FormState>();
  final UserService userService = UserService();


  /*void loginUser(String login, String password) {
    final user = User(login: login, password: password);
    print(user.login + ' ' + user.password);

    userService.check().then((checkedUser) {
      if (checkedUser != null) {
        userService.login(user).then((data) {
          print(data.token);
          SharedPreferences.getInstance().then((prefs) async {
            await prefs.setString('token', data.token);
            print(await SharedPreferences.getInstance());
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      } else {
        print("User not found");
      }
    });
  }*/


  @override
  Widget build(BuildContext context) {
    // final login = usernameController.text = "";
    // final password = passwordController.text = "";
    // final user = User(login: login, password: password);


    return Scaffold(
        appBar: AppBar(
        title: const Text('TakeAway'),
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    ),
        body:Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Username"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              try{

                                final response = userService.tryLogin(usernameController.text, passwordController.text);
                                // print(response);
                                // final response2 = userService.checkUserName("postman");
                                response.then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())));
                              }
                              catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Wrong username or password')),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill input')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Submit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }


}