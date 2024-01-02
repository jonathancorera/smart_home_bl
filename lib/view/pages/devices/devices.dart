import 'package:flutter/material.dart';
import 'package:smart_home_bl/assets.dart';
import 'package:smart_home_bl/common_libs.dart';
import 'package:smart_home_bl/model/device.dart';
import 'package:smart_home_bl/model/device_control_item.dart';
import 'package:smart_home_bl/service/db_service.dart';
import 'package:smart_home_bl/view/control/custom_elevated_button.dart';
import 'package:smart_home_bl/view/pages/devices/device_card.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  late SqliteService _sqliteService;

  List<Device> _devices = [];

  void _refreshDevices() async {
    final data = await _sqliteService.getDevices();
    setState(() {
      _devices = data;
    });
  }

  void _saveDeviceControl(DeviceControlItem deviceControlItem) async {
    await _sqliteService.createDeviceControlItem(deviceControlItem);
  }

  @override
  void initState() {
    super.initState();
    this._sqliteService = SqliteService();
    this._sqliteService.initializeDB().whenComplete(() async {
      await _refreshDevices;

      print("db initialized");
      setState(() {});

      print("control items");
      print(_devices);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    DeviceControlItem deviceControlItem;
    return Container(
      color: $styles.colors.offWhite,
      height: screenHeight,
      width: screenWidth,
      child: Column(children: [
        Padding(padding: EdgeInsets.only(top: screenHeight * 0.1)),
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Card(
                color: $styles.colors.offWhite,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular($styles.corners.md),
                ),
                child: SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.1,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: screenWidth * 0.03),
                          child: CircleAvatar(
                            backgroundColor: Colors.greenAccent[400],
                            radius: screenWidth * 0.04,
                            backgroundImage:
                                AssetImage(ImagePaths.profilePicPlaceholder),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.03),
                              child: Text(
                                "Good day, Jonathan",
                                style: $styles.textStyles.bodyText
                                    .copyWith(fontWeight: FontWeight.w200),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.07),
                              child: Text(
                                "Welcome Home",
                                style: $styles.textStyles.bodyHeader.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )))),
        Container(
          padding: EdgeInsets.only(
              top: screenHeight * 0.04, bottom: screenHeight * 0.02),
          child: Text(
            "Your Devices",
            style: $styles.textStyles.bodyHeader
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        DeviceCard(
            title: "ESP32 Test 1",
            icon: Icons.lightbulb,
            status: "Online",
            onDeviceToggle: (val) async => {
                  deviceControlItem = DeviceControlItem(
                      status: val == true ? "ON" : "OFF",
                      timestamp: DateTime.now().toString(),
                      deviceId: 1),
                  _saveDeviceControl(deviceControlItem)
                }),
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        DeviceCard(
            title: "ESP32 Test 2",
            icon: Icons.lightbulb,
            status: "Offline",
            onDeviceToggle: (val) async => {
                  deviceControlItem = DeviceControlItem(
                      status: val == true ? "ON" : "OFF",
                      timestamp: DateTime.now().toString(),
                      deviceId: 1),
                  _saveDeviceControl(deviceControlItem)
                })
      ]),
    );
  }
}
