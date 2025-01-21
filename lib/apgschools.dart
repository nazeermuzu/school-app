
import 'dart:async';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'dashb.dart';

//import 'dashboardscreen.dart';




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.blue,
      home: new Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroSlider()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible=false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueAccent,
        body: Stack(
          children: <Widget> [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 1150,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: const Padding(
                    padding: EdgeInsets.only(left:15,top: 30,right: 120),
                    child: Center(
                      child: Text("Proceed with your",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                    ),
                  ),

                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 50 ,right: 50,top: 100,),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      child: Image.asset('assets/image/APGschool.png',),
                      height: 260,
                      width: 250,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black87,
                          width: 2.0,
                        ),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.0),
                      ),

                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:110,right: 200),
              child: Center(child: Text("LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black87),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  height: 50.0,
                  child: IntlPhoneField(
                    showDropdownIcon: true,
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: InputDecoration(
                        hintText: "Phone Number"
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.60,
                // height: 50.0,
                padding: EdgeInsets.only(top: 370),
                child: TextField(
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                              () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    alignLabelWithHint: false,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:820),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text('Forgot Password',),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:620,left: 40),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    height: 50.0,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp6()));
                          print(passwordController.text);
                        },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)
                    )
                ),
              ),
            ),
          ],
        ));
  }
}


class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}
class _IntroSliderState extends State<IntroSlider> {
  PageController _controller=PageController();

  bool isLastPage=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index){
                  setState(() {
                    //2 is our last page starting from 0
                    isLastPage=index==2;
                  });
                },
                children: [
                  //One page layout
                  BuildIntroPage(
                    img: 'assets/image/APGschool.png',

                    title: 'Page One',
                    description: "AGP is a private school situated at capital"
                        "Governorate- Khanis,Kingdom of Bahrain. AGP"
                        "started operation in 1996,with around 250 puplis "
                        "in GRades one,tow,and three",
                  ),

                  BuildIntroPage(
                    img: 'assets/image/APGschool.png',
                    title: 'Page Two',
                    description: 'After peeling the strawberries, '
                        "AGP is a private school situated at capital"
                        "Governorate- Khanis,Kingdom of Bahrain. AGP"
                        "started operation in 1996,with around 250 puplis "
                        "in GRades one,tow,and three",
                  ),

                  BuildIntroPage(
                    img: 'assets/image/images 34.jpg',
                    title: 'Page Three',
                    description: "AGP is a private school situated at capital"
                        "Governorate- Khanis,Kingdom of Bahrain. AGP"
                        "started operation in 1996,with around 250 puplis "
                        "in GRades one,tow,and three",
                  ),
                ],
              )),
          SizedBox(height: 15,),
          Center(
            child: SmoothPageIndicator(
              controller: _controller, count: 3,
              onDotClicked: (index){
                _controller.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).primaryColor,
                  dotHeight: 7.0,
                  dotWidth: 7.0,
                  dotColor: Colors.black12
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),

                ),
                onPressed: isLastPage?(){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Scaffold(
                      backgroundColor: Colors.blueAccent,
                      body: Stack(
                        children: [

                        ],
                      ),
                    );
                  }));
                }:(){
                  _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                },
                child:Text(isLastPage?'CONTINUE':'Next',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ,color: Colors.white,backgroundColor: Colors.red),)),
          ),
          TextButton(
              onPressed: (){
                _controller.jumpToPage(2);
              },
              child: Text('Skip',style: TextStyle(fontSize: 18,color: Colors.black),)),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}
class BuildIntroPage extends StatelessWidget {
  String title;
  String img;
  String description;
  BuildIntroPage({
    super.key,
    required this.title,
    required this.description,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        SizedBox(
          height: 40,
        ),
        Text(title,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36),),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16,color: Colors.black87),),
        ),
        SizedBox(height: 20,),

      ],
    );
  }
}