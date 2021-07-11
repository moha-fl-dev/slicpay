import 'dart:convert' as convert;
import 'package:flutte/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String phoneNumber;
  late String uid;
  late String name;

  String url = "us-central1-slicpaydev-57f19.cloudfunctions.net";
  String endPoint = "/api/customers/login/";

  // create state
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void login() {
    if (!_formkey.currentState!.validate()) {
      print("form is not validated");
      _navigateToNextScreen(context);
      return;
    }

    _formkey.currentState?.save();

    _loginUser();
  }

  void _loginUser() async {
    try {
      Uri endpoint = Uri.https(
          this.url, this.endPoint + "/${this.email}/${this.phoneNumber}");

      http.Response response = await http.get(endpoint);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);

        this.uid = jsonResponse['uid'];
        this.name = jsonResponse['data']['customerInfo']['name'];
        Navigator.pushNamed(context, '/appPage');
      }

      if (response.statusCode != 200) {}
    } catch (e) {
      print(e);
    }
  }

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "E-mail",
        //hintText: "Johndoe@domain.com",
        border: OutlineInputBorder(),
      ),
      validator: (dynamic value) {
        if (value.isEmpty) {
          return "E-mail is required";
        }
      },
      onSaved: (dynamic value) {
        this.email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Phone number",
        //hintText: "06123456789",
        border: OutlineInputBorder(),
      ),
      validator: (dynamic value) {
        if (value.isEmpty) {
          return "Phone number is required";
        }
      },
      onSaved: (dynamic value) {
        this.phoneNumber = value;
      },
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    //Navigator.pushReplacement(MaterialPageRoute(builder: (context) => AppPage()));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Menu(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Welcome - please login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                _buildEmail(),
                SizedBox(height: 10),
                _buildPhoneNumber(),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: login,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
