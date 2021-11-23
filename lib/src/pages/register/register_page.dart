import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/src/configs/app_route.dart';
import 'package:mini_project/src/pages/login/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  LoginPage _Login;
  @override
  void initState() {
    _Login = LoginPage();
    super.initState();
  }

  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is LoginPage) {
      _Login = arguments;
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color(0XFFFBEBEBE),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 50,
                          fontFamily: 'Pacifico'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.ac_unit_outlined,
                                color: Color(0xFFFF2BA52),
                              ),
                              border: InputBorder.none,
                              hintText: "\tusername",
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.password,
                                color: Color(0xFFFF2BA52),
                              ),
                              border: InputBorder.none,
                              hintText: "\tpassword",
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Color(0xFFFF2BA52),
                              ),
                              border: InputBorder.none,
                              hintText: "\tname",
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Color(0xFFFF2BA52),
                              ),
                              border: InputBorder.none,
                              hintText: "\tsurname",
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      //SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                ElevatedButton(
                    child: Text('Register'),
                    style:
                    ElevatedButton.styleFrom(primary: Color(0XFFF000000)),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.loginRoute);
                    }),
                ElevatedButton(
                    child: Text('Login'),
                    style:
                    ElevatedButton.styleFrom(primary: Color(0XFFF000000)),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.loginRoute);
                    }),
                ElevatedButton(
                    child: Text('Censel'),
                    style:
                    ElevatedButton.styleFrom(primary: Color(0XFFF000000)),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.loginRoute);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
