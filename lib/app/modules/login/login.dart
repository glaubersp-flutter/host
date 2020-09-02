import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'credential_model.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Builder(
            builder: (context) {
              return Column(
                children: [
                  Image.asset('assets/logo.jpg'),
                  LoginForm(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            validator: validateEmail,
            decoration: new InputDecoration(labelText: 'Type your email:'),
          ),
          TextFormField(
            controller: _passwordController,
            validator: _validatePassword,
            obscureText: true,
            decoration: InputDecoration(labelText: "Type your password:"),
          ),
          Center(
            child: Column(
              children: [
                RaisedButton(
                    child: Text('Login'),
                    onPressed: () => _loginAction(context)),
                new FlatButton(
                  child: Text('Don\'t have an account? Tap here to register.'),
                  onPressed: () => _toBeImplementedAction(context),
                ),
                new FlatButton(
                  child: Text('Forgot Password?'),
                  onPressed: () => _toBeImplementedAction(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _loginAction(BuildContext context) {
    if (_formKey.currentState.validate()) {
      var model = Modular.get<CredentialModel>();
      model.setCredential("email@test.com", "username");
      Navigator.pushNamed(
        context,
        '/home',
        arguments: {'message': 'Message from Login Page'},
      );
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("See you soon: ${model.name}")));
    }
  }

  void _toBeImplementedAction(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('To be implemented!'),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  String validateEmail(value) {
    if (value.isEmpty) {
      return 'Email cannot be blank';
    }
    if (value != "email@test.com") {
      return 'Senha errada';
    }
    return null;
  }

  String _validatePassword(value) {
    if (value.isEmpty) {
      return 'Password cannot be blank';
    }
    if (value != "password") {
      return 'Wrong password.';
    }
    return null;
  }
}
