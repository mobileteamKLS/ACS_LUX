import 'dart:async';

import 'package:luxair/otherpages/bookedslotslist.dart';
import 'package:luxair/otherpages/slotlist.dart';
import 'package:luxair/otherpages/trackAndTrace.dart';
import 'package:luxair/otherpages/viewslotbooking.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:luxair/dashboards/login.dart';
import 'package:luxair/datastructure/userdetails.dart';
import 'package:luxair/global.dart';
import 'package:luxair/otherpages/cargodrop.dart';
import 'package:luxair/otherpages/cargopickup.dart';
import 'package:luxair/otherpages/dockin.dart';
import 'package:luxair/otherpages/dockout.dart';
import 'package:luxair/otherpages/dockstatus.dart';
import 'package:luxair/otherpages/feedback.dart';
import 'package:luxair/otherpages/recordpodlist.dart';
import 'package:luxair/otherpages/truckeryardcheckinlist.dart';
import 'package:luxair/otherpages/vehiclemovementtrackinglist.dart';
import 'package:luxair/otherpages/vehicletokenlist.dart';
import 'package:luxair/otherpages/warehouseacclist.dart';
import 'package:luxair/widgets/customdialogue.dart';
import 'package:luxair/widgets/headers.dart';
import 'homescreen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Dashboards extends StatefulWidget {
  Dashboards({Key? key}) : super(key: key);

  @override
  State<Dashboards> createState() => _DashboardsState();
}

class _DashboardsState extends State<Dashboards> {
  var printDate = ""; //DateFormat('dd-MMM-yyyy hh:mm').format(DateTime.now());
  bool useMobileLayout = false;
  late Timer _timer;

  @override
  void initState() {
    printDate = DateFormat('dd-MMM-yyyy hh:mm').format(DateTime.now());
    // Timer.periodic(Duration(seconds:1), (Timer t)=>getCurrentDateTime());
    _timer = new Timer.periodic(
        Duration(seconds: 1), (Timer timer) => getCurrentDateTime());
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void getCurrentDateTime() {
    setState(() {
      printDate = DateFormat('dd-MMM-yyyy hh:mm').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    var smallestDimension = MediaQuery.of(context).size.shortestSide;
    useMobileLayout = smallestDimension < 600;
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage(
      //         "https://static.vecteezy.com/system/resources/previews/005/658/973/non_2x/abstract-background-illustration-wallpaper-with-blue-light-color-blue-grid-mosaic-background-creative-design-templates-free-vector.jpg"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Opacity(
                //semi red clippath with more height and with 0.5 opacity
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(), //set our custom wave clipper
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF4364F7),
                          Color(0xFFa8c0ff),
                        ],
                      ),
                    ),
                    //color:Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height / 3, //200,
                  ),
                ),
              ),
              ClipPath(
                //upper clippath with less height
                clipper: WaveClipper(), //set our custom wave clipper.
                child: Container(
                  padding: kIsWeb
                      ? EdgeInsets.only(bottom: 56)
                      : EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF3383CD),
                        Color(0xFF11249F),
                      ],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 3.2, //180,
                  alignment: Alignment.center,

                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 15, //52,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    child: Padding(
                      padding: useMobileLayout
                          ? const EdgeInsets.only(left: 16.0, right: 16.0)
                          : const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 18.0, left: 8, right: 8),
                              child: Row(
                                  mainAxisAlignment: kIsWeb
                                      ? MainAxisAlignment.center
                                      : useMobileLayout
                                          ? MainAxisAlignment.center
                                          : MainAxisAlignment.center,
                                  crossAxisAlignment: useMobileLayout
                                      ? CrossAxisAlignment.center
                                      : CrossAxisAlignment.center,
                                  children: [
                                    if (!useMobileLayout)
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.asset(
                                              "assets/images/kls.jpg",//YVR.png", //WFS_logo.png",
                                              fit: kIsWeb
                                                  ? BoxFit.fill
                                                  : useMobileLayout
                                                      ? BoxFit.fitWidth
                                                      : BoxFit.fitWidth)),
                                    if (useMobileLayout)
                                      Container(
                                        // decoration: BoxDecoration(
                                        //   border: Border.all(
                                        //       width: 4.0, color: Colors.white),
                                        // ),
                                        height: kIsWeb
                                            ? 140
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6.5,
                                        width: kIsWeb
                                            ? 300
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.asset(
                                                "assets/images/kls.jpg", //YVR.png", //WFS_logo.png",
                                                fit: kIsWeb
                                                    ? BoxFit.fill
                                                    : useMobileLayout
                                                        ? BoxFit.fitWidth
                                                        : BoxFit.fitWidth)),
                                      ),
                                    SizedBox(
                                        width: kIsWeb
                                            ? 24
                                            : useMobileLayout
                                                ? 16
                                                : 32),
                                    Padding(
                                      padding: kIsWeb
                                          ? const EdgeInsets.only(top: 8.0)
                                          : useMobileLayout
                                              ? const EdgeInsets.only(top: 8.0)
                                              : const EdgeInsets.only(top: 2.0),
                                      child: Column(
                                        mainAxisAlignment: useMobileLayout
                                            ? MainAxisAlignment.center
                                            : MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (useMobileLayout)
                                            // Text(
                                            //   "Welcome",
                                            //   style: TextStyle(
                                            //       fontSize: useMobileLayout
                                            //           ? MediaQuery.of(context)
                                            //                   .size
                                            //                   .width /
                                            //               22
                                            //           : 28,
                                            //       fontWeight: FontWeight.bold,
                                            //       color: Colors.white),
                                            // ),
                                            DefaultTextStyle(
                                              style: TextStyle(
                                                  fontSize:
                                                    MediaQuery.of(context).size.width/24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              child: AnimatedTextKit(
                                                animatedTexts: [
                                                 
                                                  TyperAnimatedText(
                                                      'Bonjour !!'), TyperAnimatedText(
                                                      'Welcome !!'),
                                                  // TyperAnimatedText('Bienvenida !!'),
                                                  // TyperAnimatedText('ਸੁਆਗਤ ਹੈ !!'),
                                                  TyperAnimatedText(
                                                      'नमस्ते !!'),
                                                  TyperAnimatedText(
                                                      'Bienvenida !!'),
                                                  TyperAnimatedText(
                                                      'Welcome !!'),
                                                ],
                                              ),
                                            ),
                                          useMobileLayout
                                              ? SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.7,
                                                  child: Text(
                                                    loggedinUser.UserId,
                                                    style: TextStyle(
                                                        fontSize: useMobileLayout
                                                            ? MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                20
                                                            : 28,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : Text(
                                                  "Welcome " +
                                                      loggedinUser.UserId,
                                                  style: TextStyle(
                                                      fontSize: useMobileLayout
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              20
                                                          : 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                          if (!useMobileLayout)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                printDate, //"28 June 2022 23:40 ",
                                                style: TextStyle(
                                                  fontSize: useMobileLayout
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          25
                                                      : 26,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          // useMobileLayout
                                          //     ? SizedBox(height: 6)
                                          //     : SizedBox(height: 10),
                                          // if (isGHA)
                                          //   SizedBox(
                                          //     width: useMobileLayout
                                          //         ? MediaQuery.of(context)
                                          //                 .size
                                          //                 .width /
                                          //             2
                                          //         : 230,
                                          //     height: useMobileLayout
                                          //         ? MediaQuery.of(context)
                                          //                 .size
                                          //                 .height /
                                          //             18
                                          //         : 50,
                                          //     child: DropdownButtonFormField(
                                          //       // itemHeight: 230.0,

                                          //       decoration: InputDecoration(
                                          //         contentPadding:
                                          //             EdgeInsets.fromLTRB(
                                          //                 3, 0, 0, 0),
                                          //         enabledBorder:
                                          //             OutlineInputBorder(
                                          //           borderSide: BorderSide(
                                          //               color: Colors.blue,
                                          //               width: 1),
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   10),
                                          //         ),
                                          //         // border: OutlineInputBorder(
                                          //         //   borderSide: BorderSide(
                                          //         //       color: Colors.blue, width: 1),
                                          //         //   borderRadius:
                                          //         //       BorderRadius.circular(15),
                                          //         // ),
                                          //         filled: true,
                                          //         fillColor: Colors.white,
                                          //       ),
                                          //       isDense: true,
                                          //       //isExpanded: true,
                                          //       dropdownColor: Colors.white,

                                          //       menuMaxHeight:
                                          //           MediaQuery.of(context)
                                          //                   .size
                                          //                   .height /
                                          //               2.5,
                                          //       hint: Text("---- Select ----",
                                          //           style:
                                          //               iPadYellowTextFontStyleBold),

                                          //       // isExpanded: true,
                                          //       //underline: SizedBox(),
                                          //       //icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                                          //       //  if (selectedTerminalID !=0)
                                          //       value: selectedTerminalID,

                                          //       // items: [
                                          //       //   'AdminGHA',
                                          //       //   'Bldg_151',
                                          //       //   'Bldg_76',
                                          //       //   'Bldg_9',
                                          //       //   'JFK-09',
                                          //       //   'JFK-151'
                                          //       // ].map<DropdownMenuItem<String>>(
                                          //       //     (String value) {
                                          //       //   return DropdownMenuItem<String>(
                                          //       //     value: value,
                                          //       //     child: Text(
                                          //       //       value,
                                          //       //       style: useMobileLayout
                                          //       //           ? mobileTextFontStyle
                                          //       //           : TextStyle(
                                          //       //               fontSize: 22,
                                          //       //               fontWeight:
                                          //       //                   FontWeight.bold,
                                          //       //               color:
                                          //       //                   Colors.black),
                                          //       //     ),
                                          //       //   );
                                          //       // }).toList(),
                                          //       // onChanged: (value) {},

                                          //       items: terminalsList
                                          //           .map((terminal) {
                                          //         return DropdownMenuItem(
                                          //           child: Text(
                                          //               terminal.custodianName
                                          //                   .toUpperCase(),
                                          //               style: useMobileLayout
                                          //                   ? mobileTextFontStyle
                                          //                   : iPadYellowTextFontStyleBold), //label of item
                                          //           value: terminal
                                          //               .custudian, //value of item
                                          //         );
                                          //       }).toList(),
                                          //       onChanged: (value) {
                                          //         setState(() {
                                          //           selectedTerminal =
                                          //               value.toString();
                                          //           selectedTerminalID =
                                          //               int.parse(
                                          //                   value.toString());
                                          //         });
                                          //       },
                                          //     ),
                                          //   ),
                                        ],
                                      ),
                                    ),

                                    if (kIsWeb)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40.0, top: 16.0),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                //perform logout
                                                //clear share prefs
                                                //go to login screen
                                                var userSelection =
                                                    await showDialog(
                                                  context: context,
                                                  builder: (BuildContext
                                                          context) =>
                                                      CustomConfirmDialog(
                                                          title:
                                                              "Logout Confirm ?",
                                                          description:
                                                              "Are you sure you want to logout ?",
                                                          buttonText: "Yes",
                                                          imagepath:
                                                              'assets/images/question.gif',
                                                          isMobile:
                                                              useMobileLayout),
                                                );
                                                print("userSelection ==" +
                                                    userSelection.toString());
                                                if (userSelection !=
                                                    null) if (userSelection == true) {
                                                  SharedPreferences prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  prefs.clear();

                                                  loggedinUser = new UserDetails(
                                                      UserId: "",
                                                      OrgName: "",
                                                      Name: "",
                                                      EmailId: "",
                                                      MobileNo: "",
                                                      OrganizationBranchId: 0,
                                                      OrganizationId: 0,
                                                      CreatedByUserId: 0,
                                                      OrganizationTypeId: 0,
                                                      IsWFSIntegration: "",
                                                      OrganizationBranchIdString:
                                                          "",
                                                      OrganizationtypeIdString:
                                                          "");
                                                  selectedTerminal = "";
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomeScreen()),
                                                  );
                                                }
                                              },
                                              child: Icon(
                                                Icons.home,
                                                size: 48,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 24.0),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  var userSelection =
                                                      await showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        CustomConfirmDialog(
                                                            title:
                                                                "Logout Confirm ?",
                                                            description:
                                                                "Are you sure you want to logout ?",
                                                            buttonText: "Yes",
                                                            imagepath:
                                                                'assets/images/question.gif',
                                                            isMobile:
                                                                useMobileLayout),
                                                  );
                                                  print("userSelection ==" +
                                                      userSelection.toString());
                                                  if (userSelection !=
                                                      null) if (userSelection == true) {
                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.clear();
                                                    loggedinUser = new UserDetails(
                                                        UserId: "",
                                                        OrgName: "",
                                                        Name: "",
                                                        EmailId: "",
                                                        MobileNo: "",
                                                        OrganizationBranchId: 0,
                                                        OrganizationId: 0,
                                                        CreatedByUserId: 0,
                                                        OrganizationTypeId: 0,
                                                        IsWFSIntegration: "",
                                                        OrganizationBranchIdString:
                                                            "",
                                                        OrganizationtypeIdString:
                                                            "");
                                                    selectedTerminal = "";
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage()),
                                                    );
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.logout,
                                                  size: 48,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    if (!useMobileLayout && !kIsWeb)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40.0, top: 16.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  var userSelection =
                                                      await showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        CustomConfirmDialog(
                                                            title:
                                                                "Logout Confirm ?",
                                                            description:
                                                                "Are you sure you want to logout ?",
                                                            buttonText: "Yes",
                                                            imagepath:
                                                                'assets/images/question.gif',
                                                            isMobile:
                                                                useMobileLayout),
                                                  );
                                                  print("userSelection ==" +
                                                      userSelection.toString());
                                                  if (userSelection !=
                                                      null) if (userSelection == true) {
                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.clear();
                                                    loggedinUser = new UserDetails(
                                                        UserId: "",
                                                        OrgName: "",
                                                        Name: "",
                                                        EmailId: "",
                                                        MobileNo: "",
                                                        OrganizationBranchId: 0,
                                                        OrganizationId: 0,
                                                        CreatedByUserId: 0,
                                                        OrganizationTypeId: 0,
                                                        IsWFSIntegration: "",
                                                        OrganizationBranchIdString:
                                                            "",
                                                        OrganizationtypeIdString:
                                                            "");
                                                    selectedTerminal = "";
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage()),
                                                    );
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.logout,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      18, //48,

                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    if (useMobileLayout)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: GestureDetector(
                                          onTap: () async {
                                            var userSelection =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  CustomConfirmDialog(
                                                      title: "Logout Confirm ?",
                                                      description:
                                                          "Are you sure you want to logout ?",
                                                      buttonText: "Yes",
                                                      imagepath:
                                                          'assets/images/question.gif',
                                                      isMobile:
                                                          useMobileLayout),
                                            );
                                            print("userSelection ==" +
                                                userSelection.toString());
                                            if (userSelection !=
                                                null) if (userSelection == true) {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.clear();
                                              //perform logout
                                              //clear share prefs
                                              //go to login screen

                                              loggedinUser = new UserDetails(
                                                  UserId: "",
                                                  OrgName: "",
                                                  Name: "",
                                                  EmailId: "",
                                                  MobileNo: "",
                                                  OrganizationBranchId: 0,
                                                  OrganizationId: 0,
                                                  CreatedByUserId: 0,
                                                  OrganizationTypeId: 0,
                                                  IsWFSIntegration: "",
                                                  OrganizationBranchIdString:
                                                      "",
                                                  OrganizationtypeIdString: "");

                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()),
                                              );
                                            }
                                          },
                                          child: Icon(
                                            Icons.logout,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                13, //48,

                                            color: Colors.white,
                                          ),
                                        ),
                                      ),

                                    // Text("Wave clipper", style: TextStyle(
                                    //   fontSize:18, color:Colors.white,
                                    // ),

                                    // )
                                  ]),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: useMobileLayout ? 0 : 24),
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isGHA)
                  DashboardBlocks(
                      Color(0xFFff9472),
                      Color(0xFFf2709c),
                      Icons.local_shipping,
                      "Dock",
                      "In",
                      DockIn(),
                      useMobileLayout),
                if (isGHA)
                  DashboardBlocks(
                      Color(0xFFa8c0ff),
                      Color(0xFF4364F7),
                      Icons.maps_home_work,
                      "W/H",
                      "Acceptance",
                      WarehouseAcceptanceList(),
                      useMobileLayout),
                if (isGHA)
                  DashboardBlocks(
                      Color(0xFFa8c0ff),
                      Color(0xFF4364F7),
                      Icons.receipt_long,
                      "Record",
                      "POD",
                      RecordPodList(),
                      useMobileLayout),
                if (isGHA)
                  DashboardBlocks(
                      Color(0xFFff9472),
                      Color(0xFFf2709c),
                      Icons.local_shipping,
                      "Dock",
                      "Out",
                      DockOut(),
                      useMobileLayout),
                if (isGHA)
                  DashboardBlocks(
                      Color(0xFFa8c0ff),
                      Color(0xFF4364F7),
                      Icons.live_tv,
                      "View Live",
                      "Dock Status",
                      LiveDockStatus(),
                      useMobileLayout),
                if (isTrucker || isTruckerFF)
                  DashboardBlocks(
                      Color(0xFFff9472),
                      Color(0xFFf2709c),
                      Icons.check_circle_outline,
                      "Yard",
                      "Check-in",
                      TruckYardCheckInList(),
                      useMobileLayout),
                if (isTrucker || isTruckerFF)
                  DashboardBlocks(
                      Color(0xFFa8c0ff),
                      Color(0xFF4364F7),
                      Icons.local_activity_outlined,
                      "Vehicle Token",
                      "List",
                      VehicleTokenList(),
                      useMobileLayout),

                if (isTrucker || isTruckerFF)
                  DashboardBlocks(
                      Color(0xFFa8c0ff),
                      Color(0xFF4364F7),
                      Icons.history_outlined,
                      "Vehicle",
                      "Movement Tracking",
                      VehicleMovementTrackingList(),
                      useMobileLayout),

                if (isTrucker || isTruckerFF)
                  DashboardBlocks(
                      Color(0xFFff9472),
                      Color(0xFFf2709c),
                      Icons.book_online_outlined,
                      "Book",
                      "Slot",
                      SlotsList(),
                      useMobileLayout),

                if (isTrucker || isTruckerFF)
                  DashboardBlocks(
                      Color(0xFFa8c0ff),
                      Color(0xFF4364F7),
                      Icons.fact_check_outlined,
                      "View",
                      "Booked Slots",
                      BookedSlotsList(),
                      useMobileLayout),

                if (isTrucker || isTruckerFF)
                  DashboardBlocks(
                      Color(0xFFa8c0ff),
                      Color(0xFF4364F7),
                      Icons.not_listed_location_outlined,
                      "Track &",
                      "Trace",
                      TrackAndTrace(),
                      useMobileLayout),

                if (isTPS)
                  DashboardBlocks(
                      Color(0xFFff9472),
                      Color(0xFFf2709c),
                      Icons.local_shipping,
                      "Cargo",
                      "Pick-up",
                      CArgoPickUp(),
                      useMobileLayout),

                if (isTPS)
                  DashboardBlocks(
                      Color(0xFFff9472),
                      Color(0xFFf2709c),
                      Icons.local_shipping,
                      "Cargo",
                      "Drop",
                      CargoDrop(),
                      useMobileLayout),
                // DashboardBlocks(
                //     Color(0xFF9CECFB),
                //     Color(0xFF0052D4),
                //     Icons.help_center_outlined,
                //     "",
                //     "Help",
                //     Help(),
                //     useMobileLayout),
                DashboardBlocks(
                    Color(0xFF9CECFB),
                    Color(0xFF0052D4),
                    Icons.reviews_outlined,
                    "",
                    "Feedback",
                    AppFeedback(),
                    useMobileLayout),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 40.0, right: 10.0, top: 32),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => RecordPodList()),
                //       );
                //     },
                //     //padding: const EdgeInsets.all(0.0),
                //     style: ElevatedButton.styleFrom(
                //       elevation: 4.0,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10.0)), //
                //       padding: const EdgeInsets.all(0.0),
                //     ),
                //     child: Container(
                //       height: MediaQuery.of(context).size.width / 4.5,
                //       width: MediaQuery.of(context).size.width / 4.5, //180,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         gradient: LinearGradient(
                //           begin: Alignment.topRight,
                //           end: Alignment.bottomLeft,
                //           colors: [
                //             Color(0xFF19D2CA),
                //             Color(0xFF0EB5A9),
                //           ],
                //         ),
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Stack(
                //           // mainAxisAlignment: MainAxisAlignment.end,
                //           // crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Align(
                //               alignment: Alignment.topRight,
                //               child: Icon(
                //                 Icons.receipt_long,
                //                 size: 48,
                //                 color: Colors.white,
                //               ),
                //             ),
                //             Column(
                //                 mainAxisAlignment: MainAxisAlignment.end,
                //                 crossAxisAlignment:
                //                     CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Record',
                //                     style: TextStyle(
                //                         fontSize: 28,
                //                         fontWeight: FontWeight.normal,
                //                         color: Colors.white),
                //                   ),
                //                   Text('POD',
                //                       style: TextStyle(
                //                           fontSize: 28,
                //                           fontWeight: FontWeight.normal,
                //                           color: Colors.white)),
                //                   // Text('Login',
                //                   //     style: TextStyle(
                //                   //         fontSize: 28,
                //                   //         fontWeight: FontWeight.normal,
                //                   //     color: Colors.white))
                //                 ]),
                //           ],
                //         ),
                //       ),
                //     ),
                //     //Text('CONTAINED BUTTON'),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 32.0, right: 10.0, top: 32),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => LiveDockStatus()),
                //       );
                //     },
                //     //padding: const EdgeInsets.all(0.0),
                //     style: ElevatedButton.styleFrom(
                //       elevation: 4.0,
                //       // side: BorderSide(
                //       //     color: Colors.yellow,
                //       //     width: 2.0,
                //       //     style: BorderStyle.solid), //set border for the button
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10.0)), //
                //       padding: const EdgeInsets.all(0.0),
                //     ),
                //     child: Container(
                //       height: MediaQuery.of(context).size.width / 4.5,
                //       width: MediaQuery.of(context).size.width / 4.5, //180,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         gradient: LinearGradient(
                //           begin: Alignment.topRight,
                //           end: Alignment.bottomLeft,
                //           colors: [
                //             // Color(0xFF1220BC),
                //             // Color(0xFF3540E8),
                //             Color(0xFF19D2CA),
                //             Color(0xFF0EB5A9),
                //           ],
                //         ),
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Stack(
                //           // mainAxisAlignment: MainAxisAlignment.end,
                //           // crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Align(
                //               alignment: Alignment.topRight,
                //               child: Icon(
                //                 Icons.live_tv,
                //                 size: 48,
                //                 color: Colors.white,
                //               ),
                //             ),
                //             Column(
                //                 mainAxisAlignment: MainAxisAlignment.end,
                //                 crossAxisAlignment:
                //                     CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'View Live',
                //                     style: TextStyle(
                //                         fontSize: 28,
                //                         fontWeight: FontWeight.normal,
                //                         color: Colors.white),
                //                   ),
                //                   Text('Dock Status',
                //                       style: TextStyle(
                //                           fontSize: 28,
                //                           fontWeight: FontWeight.normal,
                //                           color: Colors.white)),
                //                   // Text('Login',
                //                   //     style: TextStyle(
                //                   //         fontSize: 28,
                //                   //         fontWeight: FontWeight.normal,
                //                   //     color: Colors.white))
                //                 ]),
                //           ],
                //         ),
                //       ),
                //     ),
                //     //Text('CONTAINED BUTTON'),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class DashboardBlocks extends StatelessWidget {
  DashboardBlocks(this.color1, this.color2, this.lblicon, this.btnText1,
      this.btnText2, this.pageroute, this.isMobile);

  final Color color1;
  final Color color2;
  final IconData lblicon;
  final String btnText1;
  final String btnText2;
  final pageroute;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: 300,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pageroute),
                        );
                      },
                      //padding: const EdgeInsets.all(0.0),
                      style: ElevatedButton.styleFrom(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(180),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ), //
                        padding: const EdgeInsets.all(0.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        // height: MediaQuery.of(context).size.height / 4.2,
                        // width: MediaQuery.of(context).size.width / 3, //180,
                        height: 250,
                        width: 250, //180,
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(10),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(180),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topCenter,
                            colors: [color1, color2],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              btnText1, // 'Scan',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                            Text(
                              btnText2, // 'Scan',
                              style: TextStyle(
                                  fontSize:
                                      30, //MediaQuery.of(context).size.width / 25, //30,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 96.0,
                      width: 96.0,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(lblicon, size: 64, color: color1),
                    ),
                  )
                ],
              ),
            ),
          )
        : !isMobile
            ? Container(
                height: MediaQuery.of(context).size.width / 3.5,
                width: MediaQuery.of(context).size.width / 3.5, //180,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => pageroute),
                          );
                        },
                        //padding: const EdgeInsets.all(0.0),
                        style: ElevatedButton.styleFrom(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(120),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ), //
                          padding: const EdgeInsets.all(0.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.width / 4,
                          width: MediaQuery.of(context).size.width / 4, //180,
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(10),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(120),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                              colors: [color1, color2],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                btnText1, // 'Scan',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                              Text(
                                btnText2, // 'QR code',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        //Text('CONTAINED BUTTON'),
                      ),
                    ),
                    // Positi

                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(lblicon, size: 48, color: color2),
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2.5, //180,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pageroute),
                            );
                          },
                          //padding: const EdgeInsets.all(0.0),
                          style: ElevatedButton.styleFrom(
                            elevation: 1.0,
                            // side: BorderSide(
                            //     color: Colors.yellow,
                            //     width: 2.0,
                            //     style: BorderStyle.solid), //set border for the button
                            shape: RoundedRectangleBorder(
                              //borderRadius: BorderRadius.circular(10.0)

                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(180),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ), //
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            // height: MediaQuery.of(context).size.height / 4.2,
                            // width: MediaQuery.of(context).size.width / 3, //180,
                            height: MediaQuery.of(context).size.height / 5,
                            width:
                                MediaQuery.of(context).size.width / 2.5, //180,
                            decoration: BoxDecoration(
                              //borderRadius: BorderRadius.circular(10),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(180),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topCenter,
                                colors: [
                                  // Color(0xFFdd5e89),
                                  // Color(0xFFF7BB97),
                                  color2, color1
                                  // Colors.blue.shade700,
                                  // Colors.blue,
                                  //Color(0xFF0AA1FA),
                                  //Color(0xFF0A92DF),
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  btnText1, // 'Scan',
                                  style: TextStyle(
                                      fontSize: isMobile
                                          ? MediaQuery.of(context).size.width /
                                              20
                                          : MediaQuery.of(context).size.width /
                                              25, //30,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                                Text(
                                  btnText2, // 'Scan',
                                  style: TextStyle(
                                      fontSize: isMobile
                                          ? MediaQuery.of(context).size.width /
                                              20
                                          : MediaQuery.of(context).size.width /
                                              25, //30, MediaQuery.of(context).size.width / 25, //30,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          //Text('CONTAINED BUTTON'),
                        ),
                      ),
                      // Positioned(
                      //   // top: -30,
                      //   right: 30,
                      //   child: CircleAvatar(
                      //     radius: 36.0,
                      //   ),
                      // ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height:
                              MediaQuery.of(context).size.height / 8, // 108.0,
                          width:
                              MediaQuery.of(context).size.width / 8, // 108.0,
                          decoration: BoxDecoration(
                              // border: Border.all(
                              //   width: 2,
                              //   color: Colors.white,
                              // ),
                              // color: Color(0xFF008000),
                              color: Colors.white,
                              //Colors.blue.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child:

                              // Image(
                              //   // height: 50.0,
                              //   // width: 50.0,
                              //   // fit: BoxFit.scaleDown,
                              //   image: AssetImage(
                              //       'assets/icons/qr-code-3.png'),
                              // )

                              Icon(lblicon, // Icons.qr_code,
                                  size: MediaQuery.of(context).size.width /
                                      11, //72,
                                  color: color2
                                  //  Color(0xFFdd5e89), //Colors.blue.shade700, //Colors.white,
                                  ),
                        ),
                      )
                    ],
                  ),
                ),
              );
  }
}
