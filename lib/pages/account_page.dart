import 'package:flutter/material.dart';
import 'package:sharepreftask/models/user_model.dart';

import '../services/pref_service.dart';
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void _createAccount(){
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String confirm = confirmController.text.toString().trim();

    Account account = Account(name: name, email: email, phone: phone, password: password, confirm: confirm);
    Prefs.storeAccount(account);

    Prefs.loadAccount().then((account) => {
      print(account?.name),
      print(account?.email),
      print(account?.phone),
      print(account?.password),
      print(account?.confirm),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,), onPressed: () {
          Navigator.pop(context);
        },),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Let's Get Started!", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),),
                  SizedBox(height: 10,),
                  Text("Create an account to Q Allure to get all features", style: TextStyle(color: Colors.grey, fontSize: 15),),
                ],
              ),
            ),
             Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: "Full Name",
                            border: InputBorder.none,
                            icon: Icon(Icons.account_circle_outlined, color: Colors.blue,),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        // margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                            icon: Icon(Icons.email_outlined, color: Colors.blue,),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            hintText: "Phone",
                            border: InputBorder.none,
                            icon: Icon(Icons.phone_iphone_outlined, color: Colors.blue,),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        // margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            icon: Icon(Icons.lock_open, color: Colors.blue,),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          controller: confirmController,
                          decoration: const InputDecoration(
                            hintText: "Confirm Password",
                            border: InputBorder.none,
                            icon: Icon(Icons.lock_open, color: Colors.blue,),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 70),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.indigo,
                        ),
                        child:  Center(
                          child: FlatButton(
                            onPressed: (){
                              _createAccount();
                            },
                            child: const Text("CREATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?", style: TextStyle(color: Colors.grey[700]!, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 5,),
                          const Text("Login here", style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),

                ),
            ),
          ],
        ),
      ),

    );
  }
}
