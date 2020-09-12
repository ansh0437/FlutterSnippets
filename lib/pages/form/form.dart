import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/components/text_field.dart';
import 'package:flutter_snippets/models/tutorial.dart';

class FormData {
  FormData(
      {this.username = "",
      this.fullName = "",
      this.email = "",
      this.phone = "",
      this.address = "",
      this.password = ""});

  /// Username
  String username;

  String usernameValidator(String value) {
    return value.isEmpty ? "Enter username" : null;
  }

  void usernameOnChange(String value) {
    username = value;
  }

  /// Full Name

  String fullName;

  String fullNameValidator(String value) {
    return value.isEmpty ? "Enter full name" : null;
  }

  void fullNameOnChange(String value) {
    fullName = value;
  }

  /// Email

  String email;

  String emailValidator(String value) {
    return value.isEmpty ? "Enter email" : null;
  }

  void emailOnChange(String value) {
    email = value;
  }

  /// Phone
  String phone;

  String phoneValidator(String value) {
    return value.isEmpty ? "Enter phone number" : null;
  }

  void phoneOnChange(String value) {
    phone = value;
  }

  /// Address
  String address;

  String addressValidator(String value) {
    return value.isEmpty ? "Enter address" : null;
  }

  void addressOnChange(String value) {
    address = value;
  }

  /// Password
  String password;

  String passwordValidator(String value) {
    return value.isEmpty ? "Enter password" : null;
  }

  void passwordOnChange(String value) {
    password = value;
  }

  @override
  String toString() {
    return "FormData($username, $fullName, $email, $phone, $address, $password)";
  }
}

class BasicForm extends BaseWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends BaseState<BasicForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Tutorial tutorial;
  FormData _formData = FormData();

  void _onSubmit() {
    _formKey.currentState.validate();
    SnackBar snackBar = SnackBar(content: Text(_formData.toString()));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  InputDecoration _inputDecoration(label) => InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      );

  @override
  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        key: _scaffoldKey,
        appBar: appBar(tutorial.title),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextField(
                      label: "Username",
                      initialValue: _formData.username,
                      inputValidator: _formData.usernameValidator,
                      inputOnChange: _formData.usernameOnChange,
                    ),
                    CustomTextField(
                      label: "Full Name",
                      initialValue: _formData.fullName,
                      padding: EdgeInsets.only(top: 20),
                      inputValidator: _formData.fullNameValidator,
                      inputOnChange: _formData.fullNameOnChange,
                    ),
                    CustomTextField(
                      label: "Email",
                      initialValue: _formData.email,
                      keyboardType: TextInputType.emailAddress,
                      padding: EdgeInsets.only(top: 20),
                      inputValidator: _formData.emailValidator,
                      inputOnChange: _formData.emailOnChange,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: _inputDecoration("Phone"),
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          initialValue: _formData.phone,
                          onChanged: _formData.phoneOnChange,
                          validator: _formData.phoneValidator,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: _inputDecoration("Address"),
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          initialValue: _formData.address,
                          onChanged: _formData.addressOnChange,
                          validator: _formData.addressValidator,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: _inputDecoration("Password"),
                          obscureText: true,
                          initialValue: _formData.password,
                          onChanged: _formData.passwordOnChange,
                          validator: _formData.passwordValidator,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: ButtonTheme(
                          minWidth: 250,
                          height: 40,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.red,
                            onPressed: _onSubmit,
                            child: Text("Submit",
                                style: TextStyle(color: Colors.white)),
                          ),
                        )),
                  ],
                ),
              )),
        ));
  }
}
