import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:smart_home_bl/common_libs.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  static const slogan =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat';

  static const a1 = "Bluetooth is a technology standard used to enable short-range wireless communication between electronic devices. Since Bluetooth operates on radio frequencies, rather than the infrared spectrum used by traditional remote controls, devices using this technology do not have to maintain a line of sight to communicate";
  static const a2 = "The range of the Bluetooth® connection is approximately 30 feet (10 meters). However, maximum communication range will vary depending on obstacles (person, metal, wall, etc.) or electromagnetic environment.";
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: screenHeight * 0.1),
        color: $styles.colors.offWhite,
        height: screenHeight,
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: screenWidth*0.05),
                child: Row(
                  children: [
                    Icon(
                        Icons.bluetooth,
                        size: 25,
                        color: $styles.colors.darkGray,
                      ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth*0.01)),
                    Text(
                      "Bluetooth",
                      style: $styles.textStyles.bodyHeader
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                     
                  ],
                )),
            Accordion(
              headerBorderColor: Colors.red,
              headerBorderColorOpened: Colors.transparent,
              headerBorderWidth: 1,
              headerBackgroundColorOpened: $styles.colors.accent,
              contentBackgroundColor: $styles.colors.accent,
              contentBorderColor: $styles.colors.accent,
              contentBorderWidth: 2,
              contentHorizontalPadding: 20,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              children: [
                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.help, color: $styles.colors.accent),
                  rightIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 20,
                  ),
                  headerBackgroundColor: Colors.transparent,
                  headerBackgroundColorOpened: $styles.colors.accent,
                  headerBorderColor: Colors.black54,
                  headerBorderColorOpened: Colors.black54,
                  headerBorderWidth: 1,
                  contentBackgroundColor: $styles.colors.darkGray,
                  contentBorderColor: Colors.black54,
                  contentBorderWidth: 1,
                  contentVerticalPadding: 30,
                  header: Text("Overview",
                      style: $styles.textStyles.bodyHeader),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bluetooth,
                        size: 30,
                        color: $styles.colors.offWhite,
                      ),
                      Padding(padding: EdgeInsets.only(left: screenWidth * 0.01)),
                      Flexible(
                        child: Text(
                          a1,
                          maxLines: 10,
                          style: $styles.textStyles.bodyText
                              .copyWith(color: $styles.colors.offWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.help, color: $styles.colors.accent),
                  rightIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 20,
                  ),
                  headerBackgroundColor: Colors.transparent,
                  headerBackgroundColorOpened: $styles.colors.accent,
                  headerBorderColor: Colors.black54,
                  headerBorderColorOpened: Colors.black54,
                  headerBorderWidth: 1,
                  contentBackgroundColor: $styles.colors.darkGray,
                  contentBorderColor: Colors.black54,
                  contentBorderWidth: 1,
                  contentVerticalPadding: 30,
                  header: Text('Bluetooth Range',
                      style: $styles.textStyles.bodyHeader),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bluetooth,
                        size: 30,
                        color: $styles.colors.offWhite,
                      ),
                      Padding(padding: EdgeInsets.only(left: screenWidth * 0.01)),
                      Flexible(
                        child: Text(
                          a2,
                          maxLines: 10,
                          style: $styles.textStyles.bodyText
                              .copyWith(color: $styles.colors.offWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.help, color: $styles.colors.accent),
                  rightIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 20,
                  ),
                  headerBackgroundColor: Colors.transparent,
                  headerBackgroundColorOpened: $styles.colors.accent,
                  headerBorderColor: Colors.black54,
                  headerBorderColorOpened: Colors.black54,
                  headerBorderWidth: 1,
                  contentBackgroundColor: $styles.colors.darkGray,
                  contentBorderColor: Colors.black54,
                  contentBorderWidth: 1,
                  contentVerticalPadding: 30,
                  header: Text('Pairing Bluetooth Devices',
                      style: $styles.textStyles.bodyHeader),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bluetooth,
                        size: 30,
                        color: $styles.colors.offWhite,
                      ),
                      Padding(padding: EdgeInsets.only(left: screenWidth * 0.01)),
                      Flexible(
                        child: Text(
                          slogan,
                          maxLines: 4,
                          style: $styles.textStyles.bodyText
                              .copyWith(color: $styles.colors.offWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.help, color: $styles.colors.accent),
                  rightIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 20,
                  ),
                  headerBackgroundColor: Colors.transparent,
                  headerBackgroundColorOpened: $styles.colors.accent,
                  headerBorderColor: Colors.black54,
                  headerBorderColorOpened: Colors.black54,
                  headerBorderWidth: 1,
                  contentBackgroundColor: $styles.colors.darkGray,
                  contentBorderColor: Colors.black54,
                  contentBorderWidth: 1,
                  contentVerticalPadding: 30,
                  header: Text('Connecting a Bluetooth Device',
                      style: $styles.textStyles.bodyHeader),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bluetooth,
                        size: 30,
                        color: $styles.colors.offWhite,
                      ),
                      Padding(padding: EdgeInsets.only(left: screenWidth * 0.01)),
                      Flexible(
                        child: Text(
                          slogan,
                          maxLines: 4,
                          style: $styles.textStyles.bodyText
                              .copyWith(color: $styles.colors.offWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.help, color: $styles.colors.accent),
                  rightIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 20,
                  ),
                  headerBackgroundColor: Colors.transparent,
                  headerBackgroundColorOpened: $styles.colors.accent,
                  headerBorderColor: Colors.black54,
                  headerBorderColorOpened: Colors.black54,
                  headerBorderWidth: 1,
                  contentBackgroundColor: $styles.colors.darkGray,
                  contentBorderColor: Colors.black54,
                  contentBorderWidth: 1,
                  contentVerticalPadding: 30,
                  header: Text('Controlling a Bluetooth Device',
                      style: $styles.textStyles.bodyHeader),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bluetooth,
                        size: 30,
                        color: $styles.colors.offWhite,
                      ),
                      Padding(padding: EdgeInsets.only(left: screenWidth * 0.01)),
                      Flexible(
                        child: Text(
                          slogan,
                          maxLines: 4,
                          style: $styles.textStyles.bodyText
                              .copyWith(color: $styles.colors.offWhite),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
             Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: screenWidth*0.05),
                child: Row(
                  children: [
                    Icon(
                        Icons.wifi,
                        size: 30,
                        color: $styles.colors.darkGray,
                      ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth*0.01)),
                    Text(
                      "Wi-Fi",
                      style: $styles.textStyles.bodyHeader
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                     
                  ],
                )),
            Accordion(
              headerBorderColor: Colors.red,
              headerBorderColorOpened: Colors.transparent,
              headerBorderWidth: 1,
              headerBackgroundColorOpened: $styles.colors.accent,
              contentBackgroundColor: $styles.colors.accent,
              contentBorderColor: $styles.colors.accent,
              contentBorderWidth: 2,
              contentHorizontalPadding: 20,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              children: [
                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.help, color: $styles.colors.accent),
                  rightIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 20,
                  ),
                  headerBackgroundColor: Colors.transparent,
                  headerBackgroundColorOpened: $styles.colors.accent,
                  headerBorderColor: Colors.black54,
                  headerBorderColorOpened: Colors.black54,
                  headerBorderWidth: 1,
                  contentBackgroundColor: $styles.colors.darkGray,
                  contentBorderColor: Colors.black54,
                  contentBorderWidth: 1,
                  contentVerticalPadding: 30,
                  header: Text("Overview",
                      style: $styles.textStyles.bodyHeader),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi,
                        size: 30,
                        color: $styles.colors.offWhite,
                      ),
                      Padding(padding: EdgeInsets.only(left: screenWidth * 0.01)),
                      Flexible(
                        child: Text(
                          slogan,
                          maxLines: 10,
                          style: $styles.textStyles.bodyText
                              .copyWith(color: $styles.colors.offWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.help, color: $styles.colors.accent),
                  rightIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 20,
                  ),
                  headerBackgroundColor: Colors.transparent,
                  headerBackgroundColorOpened: $styles.colors.accent,
                  headerBorderColor: Colors.black54,
                  headerBorderColorOpened: Colors.black54,
                  headerBorderWidth: 1,
                  contentBackgroundColor: $styles.colors.darkGray,
                  contentBorderColor: Colors.black54,
                  contentBorderWidth: 1,
                  contentVerticalPadding: 30,
                  header: Text('Connecting a Wi-Fi Device',
                      style: $styles.textStyles.bodyHeader),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi,
                        size: 30,
                        color: $styles.colors.offWhite,
                      ),
                      Padding(padding: EdgeInsets.only(left: screenWidth * 0.01)),
                      Flexible(
                        child: Text(
                          slogan,
                          maxLines: 10,
                          style: $styles.textStyles.bodyText
                              .copyWith(color: $styles.colors.offWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.help, color: $styles.colors.accent),
                  rightIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 20,
                  ),
                  headerBackgroundColor: Colors.transparent,
                  headerBackgroundColorOpened: $styles.colors.accent,
                  headerBorderColor: Colors.black54,
                  headerBorderColorOpened: Colors.black54,
                  headerBorderWidth: 1,
                  contentBackgroundColor: $styles.colors.darkGray,
                  contentBorderColor: Colors.black54,
                  contentBorderWidth: 1,
                  contentVerticalPadding: 30,
                  header: Text('Controlling Wi-Fi Devices',
                      style: $styles.textStyles.bodyHeader),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi,
                        size: 30,
                        color: $styles.colors.offWhite,
                      ),
                      Padding(padding: EdgeInsets.only(left: screenWidth * 0.01)),
                      Flexible(
                        child: Text(
                          slogan,
                          maxLines: 4,
                          style: $styles.textStyles.bodyText
                              .copyWith(color: $styles.colors.offWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
