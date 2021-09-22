import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {

  bool _obscureText = true;
  final FocusNode _passwordFocusNode = FocusNode();
  bool? isLoading ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
                Form(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextFormField(
                        key: ValueKey("name"),
                        //     focusNode: _userName.,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be null ';
                          }
                          return null;
                        },
                        onSaved: (value) {

                        },

                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.person),
                            labelText: "User name",
                            fillColor: Colors.orange,
                            border: UnderlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    SizedBox(height: 8,) ,
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextFormField(
                        key: ValueKey("email"),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return 'Pleas enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) {

                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email address",
                            fillColor: Colors.orange,
                            border: UnderlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    SizedBox(height: 8,) ,
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextFormField(
                        key: ValueKey("Password"),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Pleas enter a valid Password';
                          }
                          return null;
                        },
                        onSaved: (value) {

                        },
                        focusNode: _passwordFocusNode,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            labelText: "Password",
                            fillColor: Colors.orange ,
                            border: UnderlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    SizedBox(height: 8,) ,
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextFormField(
                        key: ValueKey("Phone number"),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Pleas enter a valid phone number';
                          }
                          return null;
                        },
                        onSaved: (value) {

                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Phone number",
                            fillColor: Colors.orange,
                            border: UnderlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    SizedBox(height: 9,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(

                            onPressed: () async {
                              Navigator.of(context).pushReplacementNamed("spaceX") ;
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(30),
                                        side: BorderSide(
                                            color: Theme.of(context)
                                                .backgroundColor)))),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Icon(
                                  Icons.person,
                                  size: 10,
                                )
                              ],
                            )),
                        SizedBox(
                          width: 9,
                        ),
                      ],
                    ),
                  ],
                ))
            ],
          ),
        ),
      )
    );
  }
}


/*
 Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 50, top: 20),
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.blue, fontSize: 25),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70))),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SizedBox(),
        ),
      ),
      body: Container(
          color: Colors.orange[300],
          padding: EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, i) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Enter User name",
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Enter E_mail",
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.security),
                            hintText: "Enter your password",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                      ),
                      SizedBox(height: 35),
                      CheckboxListTile(
                        value: remember,
                        onChanged: (context) {
                          setState(() {
                            remember = context!;
                            print(remember);
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("Remember me"),
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                      ),
                      SizedBox(height: 60),
                      Center(
                          child: OutlineButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("page"); //("page");
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.grey,
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.blueAccent,
                            ),
                            textColor: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 120),
                              child: Text(
                                "Continue",
                                style: TextStyle(letterSpacing: 5),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      OutlineButton(
                        onPressed: () {
                          print("hello");
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.grey,
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.blueAccent,
                        ),
                        textColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.face,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "Login With Facebook",
                                style: TextStyle(letterSpacing: 5),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })),
    )
* */