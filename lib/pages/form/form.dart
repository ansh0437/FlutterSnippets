import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/components/text_field.dart';
import 'package:flutter_snippets/models/tutorial.dart';
import 'package:flutter_snippets/pages/form/form_data.dart';

class BasicForm extends BaseWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends BaseState<BasicForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Tutorial tutorial;
  FormData _formData = FormData();

  bool passwordVisible = false;

  void _onSubmit() {
    _formKey.currentState.validate();
    SnackBar snackBar = SnackBar(content: Text(_formData.toString()));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

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
                    CustomTextField(
                      label: "Phone",
                      initialValue: _formData.phone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      padding: EdgeInsets.only(top: 20),
                      inputValidator: _formData.phoneValidator,
                      inputOnChange: _formData.phoneOnChange,
                    ),
                    CustomTextField(
                      label: "Address",
                      initialValue: _formData.address,
                      keyboardType: TextInputType.multiline,
                      padding: EdgeInsets.only(top: 20),
                      inputValidator: _formData.addressValidator,
                      inputOnChange: _formData.addressOnChange,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: passwordVisible
                                        ? Colors.purple
                                        : Colors.grey),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              )),
                          obscureText: !passwordVisible,
                          initialValue: _formData.password,
                          onChanged: _formData.passwordOnChange,
                          validator: _formData.passwordValidator,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: ButtonTheme(
                          minWidth: getWidth(),
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
