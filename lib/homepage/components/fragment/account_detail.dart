import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_foodnow_app/homepage/homepage.dart';
import 'package:flutter_foodnow_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AccountDetail extends StatefulWidget {
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  var prefs;
  var email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
    _getData() async {
    prefs = await SharedPreferences.getInstance();
    email.text = prefs.getString('username');
    password.text = prefs.getString('password');
    fullname.text = prefs.getString('fullname');
    address.text = prefs.getString('address');
    phone.text = prefs.getString('phone');
      //print(_value.toString());
  }
  @override
  Widget build(BuildContext context) {
    _getData();
    return Column(
      children: [
        MenuHeader(),
        Form(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                fullnameTextFormField(),
                SizedBox(height: 10,),
                emailTextFormField(),
                SizedBox(height: 10,),
                passwordTextFormField(),
                SizedBox(height: 10,),
                addressTextFormField(),
                SizedBox(height: 10,),
                phoneTextFormField(),
                SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton( //thay doi code
                            onPressed: () async {
                                // obtain shared preferences
                                prefs = await SharedPreferences.getInstance();
                                // prefs.setString('username', email.text);
                                // prefs.setString('password', password.text);
                                prefs.setString('fullname', fullname.text);
                                prefs.setString('address',address.text);
                                prefs.setString('phone',phone.text);
                                final result = await Navigator.pushNamed(context, HomePage.routeName);
                                User user = result as User; //thay doi code
                                email.text = user.username!; //thay doi code
                                password.text = user.password!; //thay doi code
                            },
                  style: ElevatedButton.styleFrom( //thay doi code
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  primary: Colors.green,
                  ),
                  child: Text("Save", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),)
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

    TextFormField emailTextFormField() {
    return TextFormField(
      controller: email,
      enabled:false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)
      ),
    );
  }

  Widget MenuHeader(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.green
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
            Expanded(child: Text("Account info", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)),
            ],
          )));
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      controller: password,
      enabled:false,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
    );
  }

  TextFormField fullnameTextFormField() {
    return TextFormField(
      controller: fullname,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your full name ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.perm_identity_outlined)
      ),
    );
  }

  TextFormField addressTextFormField() {
    return TextFormField(
      controller: address,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your address",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.location_on_outlined)
      ),
    );
  }

  TextFormField phoneTextFormField() {
    return TextFormField(
      controller: phone,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your phone",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.phone_outlined)
      ),
    );
  }
  
}