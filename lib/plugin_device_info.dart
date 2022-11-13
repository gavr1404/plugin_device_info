// import 'plugin_device_info_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_information/device_information.dart';

// class PluginDeviceInfo {
//   Future<String?> getPlatformVersion() {
//     return PluginDeviceInfoPlatform.instance.getPlatformVersion();
//   }
// }

class PluginDeviceInfo extends StatefulWidget {
  const PluginDeviceInfo({super.key});

  @override
  State<StatefulWidget> createState() => DeviceDataState();
}

class DeviceDataState extends State<PluginDeviceInfo> {
  String myDevice = 'Unknown';
  String myPlatform = 'Unknown';
  String myImei = 'Unknown';
  String myManufacturer = 'Unknown';
  String myProduct = 'Unknown';
  String myCpuType = 'Unknown';

  @override
  void initState() {
    super.initState();
    myDeviceData();
  }

  Future<void> myDeviceData() async {
    String nameMyCpuType;
    String nameMyDevice;
    String nameMyPlatform;
    String nameMyImai;
    String nameMyManufacturer;
    String nameMyProduct;

    try {
      nameMyCpuType = await DeviceInformation.cpuName;
    } on PlatformException {
      nameMyCpuType = 'None';
    }

    try {
      nameMyProduct = await DeviceInformation.productName;
    } on PlatformException {
      nameMyProduct = 'None';
    }

    try {
      nameMyManufacturer = await DeviceInformation.deviceManufacturer;
    } on PlatformException {
      nameMyManufacturer = 'None';
    }

    try {
      nameMyDevice = await DeviceInformation.deviceModel;
    } on PlatformException {
      nameMyDevice = 'None';
    }

    try {
      nameMyImai = await DeviceInformation.deviceIMEINumber;
    } on PlatformException {
      nameMyImai = 'None';
    }

    try {
      nameMyPlatform = await DeviceInformation.platformVersion;
    } on PlatformException {
      nameMyPlatform = 'Failed to get platform version';
    }

    setState(() {
      myDevice = nameMyDevice;
      myPlatform = nameMyPlatform;
      myImei = nameMyImai;
      myManufacturer = nameMyManufacturer;
      myProduct = nameMyProduct;
      myCpuType = nameMyCpuType;
    });
  }

  @override
  Widget build(BuildContext context) {
    myDeviceData();

    return Container(
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 90, 90, 50),
          width: 5,
        ),
        color: const Color.fromARGB(255, 106, 106, 69),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(180, 158, 158, 85),
            offset: Offset(10.0, 10.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Інформація о пристрої',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Platform version - ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: myPlatform,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Imei number - ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: myImei,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Model name - ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: myDevice,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Product name - ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: myProduct,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Manufacturer - ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: myManufacturer,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'CPU type - ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: myCpuType,
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
