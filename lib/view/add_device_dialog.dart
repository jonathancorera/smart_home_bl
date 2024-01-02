import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:smart_home_bl/view/control/custom_elevated_button.dart';

import '../styles/styles.dart';

class AddDeviceDialog extends StatefulWidget {
  const AddDeviceDialog({super.key, required this.onDeviceConnect});

  final Function onDeviceConnect;

  @override
  State<AddDeviceDialog> createState() => _AddDeviceDialogState();
}

class _AddDeviceDialogState extends State<AddDeviceDialog> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  List<BluetoothDevice> devices = [];

  _addDeviceTolist(final BluetoothDevice device) {
    if (!devices.contains(device)) {
      setState(() {
        devices.add(device);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

//scan for devices
  void startScanning() async {
    await flutterBlue.startScan();
    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (!devices.contains(result.device)) {
          setState(() {
            devices.add(result.device);
          });

          print(devices);
        }
      }
    });
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
    widget.onDeviceConnect(device);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular($styles.corners.md),
          ),
          side: BorderSide(
            width: 5.0,
            color: $styles.colors.offWhite,
          ),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular($styles.corners.md),
            ),
            child: Container(
              color: $styles.colors.offWhite,
              height: screenHeight * 0.7,
              width: screenWidth * 0.8,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                        width: screenWidth,
                        color: $styles.colors.darkGray,
                        child: Text(
                          "Add a Bluetooth Device",
                          style: $styles.textStyles.bodyHeader
                              .copyWith(color: $styles.colors.offWhite),
                          textAlign: TextAlign.center,
                        )),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                      child: CustomElevatedButton(
                          label: "Scan",
                          onPressed: () {
                            startScanning();
                          }),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                        width: screenWidth,
                        child: Text(
                          devices.length.toString(),
                          style: $styles.textStyles.bodyHeader
                              .copyWith(color: $styles.colors.darkGray),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: screenHeight * 0.4,
                      child: ListView.builder(
                        itemCount: devices.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(devices[index].name),
                            subtitle: Text(devices[index].id.toString()),
                          );
                        },
                      ),
                    ),
                    
                  ]),
            )));
  }
}
