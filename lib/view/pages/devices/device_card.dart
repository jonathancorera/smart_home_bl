import 'package:flutter/material.dart';

import '../../../common_libs.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({super.key, required this.title, required this.icon, required this.status, required this.onDeviceToggle});

  final String title;
  final IconData icon;
  final String status;
    final Function onDeviceToggle;

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {

    bool _switchValue = false; 

  @override
  Widget build(BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
                      color: $styles.colors.offWhite,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular($styles.corners.md),
                      ),
                      child: SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth*0.9,
                        child: Transform.scale(
                          scale: 0.8,
                          child: SwitchListTile(
                            dense: true,
                            
                            activeColor: $styles.colors.accent,
    activeTrackColor: $styles.colors.darkGray,
    inactiveThumbColor: Colors.black,
    inactiveTrackColor: Colors.blueGrey,
                            subtitle: Container(
                              child: Text(widget.status, style: $styles.textStyles.bodyText.copyWith(fontWeight: FontWeight.bold,   color: widget.status == "Online" ? Colors.green : Colors.red),)),
                            title: Row(
                              children: [
                                Icon(widget.icon, color: $styles.colors.darkGray,),
                                Padding(padding: EdgeInsets.only(left: 5)),
                                Text(widget.title, style: $styles.textStyles.cardHeaderText.copyWith(color: $styles.colors.darkGray, fontSize: 20),),

                              ],
                            ),
                    
                             value: _switchValue,
                                onChanged:(bool? value) { 
                                    setState(() {
                                      _switchValue = value!;
                                    });

                                  widget.onDeviceToggle(value);

                                },

                            
                          ),
                        ),
                      
                      ));
  }
}