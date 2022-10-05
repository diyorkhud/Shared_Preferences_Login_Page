import 'package:flutter/material.dart';
import 'package:sharepreftask/pages/account_page.dart';

import '../models/user_model.dart';
import '../services/pref_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void openAccountPage(BuildContext ctx){
    Navigator.push(ctx, MaterialPageRoute(builder: (_){
      return const AccountPage();
    }));
  }

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin(){
    String name = nameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User.from(name: name, password: password,);
    Prefs.storeUser(user);

    Prefs.loadUser().then((user) => {
      print(user?.name),
      print(user?.password),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
         decoration: const BoxDecoration(
           color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 90,),
            //#welcome
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Image(image: AssetImage("assets/images/loginUI.png"),height: 150,),
                  Text('Welcome back!', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('Log in to your existent account of Q Allure', style: TextStyle(color: Colors.grey, fontSize: 15),),
                ],
              ),

            ),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        // #email, # password
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
                              hintText: "Email",
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
                            controller: passwordController,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                              icon: Icon(Icons.lock_outline, color: Colors.blue,),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Forgot password?", style: TextStyle(color: Colors.grey[600]),),
                          ],
                        ),
                        const SizedBox(height: 20,),

                        // #loginButton
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.indigo,
                          ),
                          child: Center(
                            child: FlatButton(
                              onPressed: (){
                                _doLogin();
                              },
                              child: const Text("Log In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        // #or connect
                        const Text('Or connect using', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 20,),

                        // #facebook, #google
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('f', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                                      SizedBox(width: 10,),
                                      Text('Facebook', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.redAccent,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                                      SizedBox(width: 10,),
                                      Text('Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8,),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?", style: TextStyle(color: Colors.grey[700]!),),
                            const SizedBox(width: 5,),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                              ),
                              onPressed: ()=> openAccountPage(context),
                              child: const Text('Sign Up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}