import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speed_test_dart/classes/server.dart';
import 'package:speed_test_dart/speed_test_dart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class TestInternetScreen extends StatefulWidget {
  const TestInternetScreen({super.key});

  @override
  State<TestInternetScreen> createState() => _TestInternetScreenState();
}

class _TestInternetScreenState extends State<TestInternetScreen> {
  SpeedTestDart tester = SpeedTestDart();
  List<Server> bestServersList = [];

  double downloadRate = 0;
  double uploadRate = 0;
  double _speedValue = 0;

  bool readyToTest = false;
  bool loadingDownload = false;
  bool loadingUpload = false;

  Future<void> setBestServers() async {
    final settings = await tester.getSettings();
    final servers = settings.servers;

    final _bestServersList = await tester.getBestServers(
      servers: servers,
    );

    setState(() {
      bestServersList = _bestServersList;
      readyToTest = true;
    });
  }

  Future<void> _testDownloadSpeed() async {
    setState(() {
      loadingDownload = true;
    });
    final _downloadRate =
        await tester.testDownloadSpeed(servers: bestServersList);
    setState(() {
      downloadRate = _downloadRate;
      _speedValue = downloadRate;
      loadingDownload = false;
    });
  }

  Future<void> _testUploadSpeed() async {
    setState(() {
      loadingUpload = true;
    });

    final _uploadRate = await tester.testUploadSpeed(servers: bestServersList);

    setState(() {
      uploadRate = _uploadRate;
      _speedValue = uploadRate;
      loadingUpload = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setBestServers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading:  IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.colorPurpleInLogin,
            ),
          ),
          title: Text(
            context.localizations.testSpeedInternetScreen1,
            style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold,
                color: AppColors.colorPurpleInLogin,
                fontSize: 16.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SfRadialGauge(
                    enableLoadingAnimation: true,
                    animationDuration: 4500,
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 0, maximum: 60, ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0, endValue: 20, color: Colors.green),
                        GaugeRange(
                            startValue: 20, endValue: 40, color: Colors.orange),
                        GaugeRange(
                            startValue: 40, endValue: 60, color: Colors.red)
                      ], pointers: <GaugePointer>[
                        NeedlePointer(
                          value: _speedValue,
                        )
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                                child: Text(
                                    "${_speedValue.toStringAsFixed(2)} Mb/s",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold))),
                            angle: 90,
                            positionFactor: 0.6)
                      ])
                    ]),
                Text(
                  context.localizations.testSpeedInternetScreen2,
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(
                  height: 10,
                ),
                if (loadingUpload)
                  const Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text('Testing upload speed...'),
                    ],
                  )
                else
                  Text('Upload rate ${uploadRate.toStringAsFixed(2)} Mb/s'),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: loadingUpload
                      ? null
                      : () async {
                          if (!readyToTest || bestServersList.isEmpty) return;
                          await _testUploadSpeed();
                        },
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: AppColors.colorPurpleInLogin
                  // ),
                  child: Text(
                    context.localizations.testSpeedInternetScreen4,
                    style: GoogleFonts.cairo(
                        color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  context.localizations.testSpeedInternetScreen3,
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 10),
                if (loadingDownload)
                  const Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Testing download speed...'),
                    ],
                  )
                else
                  Text('Download rate ${downloadRate.toStringAsFixed(2)} Mb/s'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: loadingDownload
                      ? null
                      : () async {
                          if (!readyToTest || bestServersList.isEmpty) return;
                          await _testDownloadSpeed();
                        },
                  // style: ElevatedButton.styleFrom(
                  //     backgroundColor: AppColors.colorPurpleInLogin
                  // ),
                  child: Text(
                    context.localizations.testSpeedInternetScreen4,
                    style: GoogleFonts.cairo(
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
