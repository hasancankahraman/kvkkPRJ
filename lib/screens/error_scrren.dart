// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings

import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:device_info_plus/device_info_plus.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  String deviceInformation = "Süprizzz dene bakalımm";

  deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var device = await deviceInfo.androidInfo;
      deviceInformation = device.board +
          "\r\n" +
          device.bootloader +
          "\r\n" +
          device.brand +
          "\r\n" +
          device.device +
          "\r\n" +
          device.display +
          "\r\n" +
          device.fingerprint +
          "\r\n" +
          device.hardware +
          "\r\n" +
          device.host +
          "\r\n" +
          device.id +
          "\r\n" +
          device.manufacturer +
          "\r\n" +
          device.model +
          "\r\n" +
          device.product +
          "\r\n" +
          device.serialNumber +
          "\r\n" +
          device.tags +
          "\r\n" +
          device.type +
          "\r\n" +
          device.displayMetrics.toString() +
          "\r\n" +
          device.isPhysicalDevice.toString() +
          "\r\n" +
          device.isPhysicalDevice.toString() +
          "\r\n" +
          device.supported32BitAbis.toString() +
          "\r\n" +
          device.supported64BitAbis.toString() +
          "\r\n" +
          device.supportedAbis.toString() +
          "\r\n" +
          device.supportedAbis.toString() +
          "\r\n" +
          device.systemFeatures.toString() +
          "\r\n" +
          device.version.toString() +
          "\r\n" +
          device.data.toString();
    } else if (Platform.isIOS) {
      var device = await deviceInfo.iosInfo;
      deviceInformation = device.isPhysicalDevice.toString() +
          "\r\n" +
          device.utsname.toString() +
          "\r\n" +
          device.data.toString() +
          "\r\n" +
          device.identifierForVendor.toString() +
          "\r\n" +
          device.localizedModel.toString() +
          "\r\n" +
          device.model.toString() +
          "\r\n" +
          device.name.toString() +
          "\r\n" +
          device.systemName.toString() +
          "\r\n" +
          device.systemVersion.toString();
    } else if (Platform.isWindows) {
      var device = await deviceInfo.windowsInfo;
      deviceInformation = device.buildLab +
          "\r\n" +
          device.buildLabEx +
          "\r\n" +
          device.computerName +
          "\r\n" +
          device.csdVersion +
          "\r\n" +
          device.deviceId +
          "\r\n" +
          device.displayVersion +
          "\r\n" +
          device.editionId +
          "\r\n" +
          device.productId +
          "\r\n" +
          device.productName +
          "\r\n" +
          device.registeredOwner +
          "\r\n" +
          device.releaseId +
          "\r\n" +
          device.userName +
          "\r\n" +
          device.buildNumber.toString() +
          "\r\n" +
          device.digitalProductId.toString() +
          "\r\n" +
          device.installDate.toString() +
          "\r\n" +
          device.majorVersion.toString() +
          "\r\n" +
          device.minorVersion.toString() +
          "\r\n" +
          device.numberOfCores.toString() +
          "\r\n" +
          device.platformId.toString() +
          "\r\n" +
          device.productType.toString() +
          "\r\n" +
          device.reserved.toString() +
          "\r\n" +
          device.servicePackMajor.toString() +
          "\r\n" +
          device.suitMask.toString() +
          "\r\n" +
          device.systemMemoryInMegabytes.toString();
    } else if (Platform.isMacOS) {
      var device = await deviceInfo.macOsInfo;
      deviceInformation = device.arch +
          "\r\n" +
          device.computerName +
          "\r\n" +
          device.hostName +
          "\r\n" +
          device.kernelVersion +
          "\r\n" +
          device.model +
          "\r\n" +
          device.osRelease +
          "\r\n" +
          device.osRelease +
          "\r\n" +
          device.activeCPUs.toString() +
          "\r\n" +
          device.cpuFrequency.toString() +
          "\r\n" +
          device.memorySize.toString() +
          "\r\n" +
          device.data.toString();
    } else if (Platform.isLinux) {
      var device = await deviceInfo.linuxInfo;
      deviceInformation = device.id +
          "\r\n" +
          device.name +
          "\r\n" +
          device.prettyName +
          "\r\n" +
          device.idLike.toString() +
          "\r\n" +
          device.data.toString() +
          "\r\n" +
          device.buildId.toString() +
          "\r\n" +
          device.machineId.toString() +
          "\r\n" +
          device.variant.toString() +
          "\r\n" +
          device.variantId.toString() +
          "\r\n" +
          device.version.toString() +
          "\r\n" +
          device.versionCodename.toString() +
          "\r\n" +
          device.versionId.toString();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bil Bakalım Bu Ne'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.network(
            //  "https://cdn.discordapp.com/attachments/944354030409367622/1093603708052447382/1673789791664.jpeg"),
            SizedBox(height: 16),
            InkWell(
                onTap: () {
                  deviceInfo();
                },
                child: Text(deviceInformation)),
          ],
        ),
      ),
    );
  }
}
