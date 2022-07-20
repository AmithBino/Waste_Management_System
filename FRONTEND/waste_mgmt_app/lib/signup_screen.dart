import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:waste_mgmt_app/login_screen.dart';
import './user.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  List<String> items = ['Select one', 'User', 'Collector'];
  String? selectedItem = 'Select one';
  User user = User('', '', '', '', '');
  Future save() async {
    try {
      var response = await http.post(Uri.parse("http://192.168.1.41:5000/user"),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: <String, String>{
            'role': user.role,
            'name': user.name,
            'email': user.email,
            'phone': user.phone,
            'password': user.password
          });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print("account created succesfully");
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
    // .then((response) => print(response.body))
    // .catchError((err) => print(err));
    // print(res.body);
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(90)),
                        color: new Color(0xff1FAB89),
                        gradient: LinearGradient(
                          colors: [
                            (new Color(0xff1FAB89)),
                            new Color(0xff62D2A2)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Image.asset(
                              'assets/images/logoo.png',
                              height: 130,
                              width: 130,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20, top: 20),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Register",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )
                        ],
                      )),
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                        child: SizedBox(
                            width: 200,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xff1FAB89)),
                                ),
                              ),
                              value: selectedItem,
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: TextStyle(fontSize: 18)),
                                      ))
                                  .toList(),
                              onChanged: (item) =>
                                  setState(() => selectedItem = item),
                            ))),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: TextFormField(
                        controller: TextEditingController(text: user.phone),
                        onChanged: (value) {
                          user.phone = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Something";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Color(0xff1FAB89),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xff1FAB89),
                          ),
                          hintText: "Full Name",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: TextFormField(
                        controller: TextEditingController(text: user.email),
                        onChanged: (value) {
                          user.email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Something";
                          } else if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return "enter valid email";
                          }
                        },
                        cursorColor: Color(0xff1FAB89),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Color(0xff1FAB89),
                          ),
                          hintText: "Email",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffEEEEEE),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 100,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: TextFormField(
                        controller: TextEditingController(text: user.phone),
                        onChanged: (value) {
                          user.phone = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Something";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Color(0xff1FAB89),
                        decoration: InputDecoration(
                          focusColor: Color(0xff1FAB89),
                          icon: Icon(
                            Icons.phone,
                            color: Color(0xff1FAB89),
                          ),
                          hintText: "Phone Number",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffEEEEEE),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 100,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: TextFormField(
                        controller: TextEditingController(text: user.password),
                        onChanged: (value) {
                          user.password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Something";
                          } else {
                            return null;
                          }
                        },
                        obscureText: isHiddenPassword,
                        cursorColor: Color(0xff1FAB89),
                        decoration: InputDecoration(
                          focusColor: Color(0xff1FAB89),
                          icon: Icon(
                            Icons.vpn_key,
                            color: Color(0xff1FAB89),
                          ),
                          hintText: "Enter Password",
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              isHiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xff1FAB89),
                            ),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                (new Color(0xff1FAB89)),
                                new Color(0xff62D2A2)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200],
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form != null && form.validate()) {
                              save();
                            } else {
                              print("not ok");
                            }
                          },
                          child: Text(
                            "REGISTER",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Have An Account?  "),
                          GestureDetector(
                            child: Text(
                              "Login Now",
                              style: TextStyle(color: Color(0xff1FAB89)),
                            ),
                            onTap: () {
                              // Write Tap Code Here.
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
