import 'package:flutter/material.dart';
import 'package:smart_home_bl/common_libs.dart';
import 'package:smart_home_bl/router.dart';

import '../../../assets.dart';
import '../../control/custom_elevated_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  
  @override
  Widget build(BuildContext context) {
          double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: $styles.colors.offWhite,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        primary: false,
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: screenHeight * 0.3,
                  width: screenWidth *0.8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      
                        image: AssetImage(ImagePaths.logo),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Container(
                color: $styles.colors.offWhite,
                height: screenHeight * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("Welcome",
                          style: $styles.textStyles.loginHeaderText.copyWith(color: $styles.colors.darkGray),
                          textAlign: TextAlign.center,
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor),
                    ),
                    Container(
                        padding:  EdgeInsets.only(top: screenHeight*0.1, left: screenWidth*0.1),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("You're one click away from a smarter home",
                              style: $styles.textStyles.headerText,
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor),
                        )),
                    Padding(padding: EdgeInsets.only(top: screenHeight * 0.1)),
                    Container(
                      color: $styles.colors.darkGray,
                      height: screenHeight*0.15,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child:  CustomElevatedButton(
                                      onPressed: () async {
                      
                                        GoRouter.of(context).go(ScreenPaths.home);
                                      
                                      },
                                      label: "Get Started",
                                      hasTrailingIcon: true,
                                    )),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          
        ),
      ),
    );
  }
}