import 'package:flutter/material.dart';
import 'package:smart_home_bl/common_libs.dart';
import 'package:smart_home_bl/view/control/custom_elevated_button.dart';

import '../../../model/device_control_item.dart';
import '../../../service/db_service.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late SqliteService _sqliteService;

  List<DeviceControlItem> _deviceControlItems =
      [
        DeviceControlItem(id: 1, status: "ON", timestamp: DateTime.now().toString(), deviceId: 1),
        DeviceControlItem(id: 2, status: "OFF", timestamp: DateTime.now().toString(), deviceId: 1),
        DeviceControlItem(id: 3, status: "ON", timestamp: DateTime.now().toString(), deviceId: 1),
        DeviceControlItem(id: 4, status: "ON", timestamp: DateTime.now().toString(), deviceId: 2),
        DeviceControlItem(id: 5, status: "OFF", timestamp: DateTime.now().toString(), deviceId: 2)


      ]; 

  void _refreshDeviceControl() async {
    final data = await _sqliteService.getDeviceControlItems();
    setState(() {
      _deviceControlItems = data;
    });
  }


  @override
  void initState() {
    super.initState();
    this._sqliteService = SqliteService();
    this._sqliteService.initializeDB().whenComplete(() async {
      await _refreshDeviceControl;

      print("db initialized");
      setState(() {});

      print("control items");
      print(_deviceControlItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: $styles.colors.offWhite,
      height: screenHeight,
      width: screenWidth,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: screenHeight*0.1)),
          Text("Your Action History", style: $styles.textStyles.bodyHeader,),
          SizedBox(
            height: screenHeight*0.85,
            child: ListView.builder(
          
              itemCount: _deviceControlItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    backgroundColor: $styles.colors.accent,
                    child: Text(_deviceControlItems[index].status, style: $styles.textStyles.bodyHeader,),
                  ),
                  title: Text('Id:  ${_deviceControlItems[index].id}', style: $styles.textStyles.bodyHeader,),
                  subtitle: Text('Device with id ${_deviceControlItems[index].deviceId} turned ${_deviceControlItems[index].status}', style: $styles.textStyles.bodyText),
                );
              }
            ),
          )
          
        ]),
      
    );
  }
}
