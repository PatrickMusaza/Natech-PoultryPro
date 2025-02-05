import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'management_model.dart';
export 'management_model.dart';

class ManagementWidget extends StatefulWidget {
  const ManagementWidget({super.key});

  @override
  State<ManagementWidget> createState() => _ManagementWidgetState();
}

class _ManagementWidgetState extends State<ManagementWidget> {
  late ManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> _items = [
    {
      "question": "What is a Broiler?",
      "answer":
          "Broilers are poly-hybrid birds that grow quickly with a high meat content and have a good feed conversion capacity. They can survive up to two out of 100 birds with proper management. Male broilers may grow faster than females, but some breeds may not show this difference. Proper broiler production requires a well-structured production cyclogram, which includes mis-en-place, husbandry, marketing, and service periods. This helps build relationships with business partners like feed suppliers, chick suppliers, and consumers of broiler meat and by-products like feathers and manure. A cyclogram helps build relationships with these partners."
    },
    {
      "question": "What is the Aim of Broiler Production?",
      "answer":
          "Broiler production aims to meet consumer standards in carcass quality and weight, while also reducing production costs. Breeding advances in broiler parent stocks have enabled broiler keepers to exploit their output potentials. This involves intensification, where feed intake and growth rates can be influenced to shorten the fattening period and reduce feed intake while still achieving desired outputs in slaughter weight and carcass quality. Farmers can achieve these output parameters with available feeds and minimal management under a deep litter system without the use of synthetic boosters."
    },
    {
      "question": "What Do We Mean by Mortality Rate in Broilers?",
      "answer":
          "Mortality rates refer to deaths caused by inherent or managerial causative effects. In broilers, the genetically expected mortality rate is around 2%, while managerial causative effects, resulting from weaknesses and failures in management systems, are around 3%. This results in a mortality rate in broiler production of 5%."
    },
    {
      "question": "What Are Stocking Rates for Broilers?",
      "answer":
          "Stocking rate is the number of birds a square meter can hold during bird rearing, typically 10-12 birds per square meter. Commercial farmers use this rate to justify using specific rearing systems or cyclograms. The same rate per square meter may result in different stocking rates per annum per square meter depending on the system and cyclogram used."
    },
    {
      "question":
          "What Are Some Examples of Stocking Rates Used in Broiler Production?",
      "answer":
          "In traditional production, the stocking rate per meter squared is 50 birds per meter annually. High-intensity production: 60 birds per square meter each year. Sivyham Production: Stocking rate per meter squared = 60 birds/m/year."
    },
    {
      "question": "How Many Birds Should One Start With?",
      "answer":
          "The correct answer is to start with as many broilers as you can sell in three days and as many as the available facilities can hold. The focus should be on management and marketing rather than just numbers."
    },
    {
      "question": "How Many Birds Can One Sell in Three Days?",
      "answer":
          "Community-specific outlet facilities and eating habits influence the preference for broilers. Farmers must discover these factors to ensure high three-day sales. Marketing issues such as location, price, quality, packaging, and merchandising all play a role in influencing sales."
    },
    {
      "question": "What Is the Capacity of the Available Facilities?",
      "answer":
          "The design of the broiler house and the equipment employed, like feeders and drinkers, can be used to evaluate the capacity of the facilities. By multiplying the usable floor space by the number of birds per square meter (typically 10 birds per square meter), one can determine the ideal population density. For example, 1000 birds can be housed in a facility with 100 square meters of usable floor space."
    },
    {
      "question":
          "What Are the Common Three Mistakes One Shouldn’t Make When Deciding How Many Chicks to Start With?",
      "answer":
          "1. Never forget the factors, be more than a producer, and investigate the business. 2. Don't let the availability of cash lead you to get more chicks. 3. Don't let lower chick prices urge you to order more chicks."
    },
    {
      "question": "What Is a Broiler Production Cyclogram?",
      "answer":
          "A production cyclogram is a controlled production cycle. It starts on the day one batch of broilers arrives and finishes on the day the next group arrives. It consists of Mis-en-place (preparatory operations), husbandry (fattening operations), marketing, and the service period."
    },
    {
      "question": "When Should I Put Litter in the Broiler House?",
      "answer":
          "Two days before the chicks are brought in, litter should be put on the floor of the broiler house. This allows the litter and the dust from the litter to settle. Ensure a thickness of not less than 10cm on the floor."
    },
    {
      "question": "How Should I Provide Warmth for My Broilers?",
      "answer":
          "The broiler house should be heated to no more than 33 degrees Celsius. A brooder ring or a centrally heated system can be used. At least four hours before the chicks' arrival, the broiler house should be heated."
    },
    {
      "question":
          "What About Provision of Vitamin Solutions to Day-Old Chicks?",
      "answer":
          "An hour before chicks come in, vitamin solution should be put in fount drinkers to facilitate its rise in temperature to 21 degrees Celsius. One 1-liter fount drinker should be made available to cater for 25 chicks."
    },
    {
      "question": "What About Provision of Light to Day-Old Chicks?",
      "answer":
          "A light intensity of 3 watts/square meter in the first week should be facilitated. Ensure that the broiler house is well lit before the chicks are brought in."
    },
    {
      "question":
          "Are There Other Hygiene Factors One Should Consider Before Bringing in Day-Old Chicks?",
      "answer":
          "Foot baths by the doors should be provided in readiness for the coming in of broilers."
    },
    {
      "question":
          "What Is Meant by Water and Drinker Management in Broiler Production?",
      "answer":
          "Water must be provided from the first minute of arrival in the form of a vitamin solution and should be available all the time. Drinkers should be washed every day and hung such that the bases of the drinkers are level with the backs of the chickens."
    },
    {
      "question":
          "What Is Meant by Feed and Feeder Management in Broiler Production?",
      "answer":
          "Feed should be made available 30 minutes after the introduction of vitamin solution to chicks and should be provided all the time. Ad-libitum feeding is encouraged. Feeders should be cleaned at least twice per week and changed according to the cyclogram used."
    },
    {
      "question":
          "What Is Meant by Heat and Heater Management in Broiler Production?",
      "answer":
          "There are two systems used in broiler house heating: the whole room heating system and the combined heating system. Temperature should be regulated based on the age of the broilers, and heat sources should hang at least 10 cm above the heads of the broilers."
    },
    {
      "question": "What Is Litter Management?",
      "answer":
          "Litter should be forked at least once per week to avoid the formation of hardpan and over-wetting. Ensure proper ventilation and a thickness of not less than 10cm on the floor at all times."
    },
    {
      "question": "What Is Meant by Light Management in Broiler Production?",
      "answer":
          "A 24-hour light program is essential for broilers. Light intensity should be controlled, with a high intensity of more than 3 watts/square meter in the first week and more than 1 watt/square meter from the fourth week onwards."
    },
    {
      "question": "What Is a Traditional Broiler Production Cyclogram?",
      "answer":
          "The traditional production cyclogram is an 8+2 week cycle, allowing farmers to grow broilers at least five times a year in the same building. It requires only 10 birds per square meter and is recommended for beginners."
    },
    {
      "question": "What Is an Intensive Broiler Production Cyclogram?",
      "answer":
          "The intensive production cyclogram is a high-yielding cyclogram that allows farmers to crop 6.5 times per year, with up to 12 birds per square meter. It requires tip-top management and is most effective in cool seasons."
    },
    {
      "question": "What Is the Sivyham Broiler Production Cyclogram?",
      "answer":
          "The Sivyham cyclogram is a 7+2 week production cycle that allows for a stocking rate of 11 birds per square meter and requires medium management skill. It can be used throughout the year."
    },
    {
      "question": "What Are the Ten Commandments of Broiler Production?",
      "answer":
          "1. Ensure proper housing.\n2. Ensure that the litter is clean and dry.\n3. Ensure there is enough clean water and food all the time.\n4. Never mix different age groups.\n5. Broilers only—don’t mix broilers with other birds.\n6. No free-range chickens nearby.\n7. No non-broiler workers in broiler houses.\n8. Sterilize (disinfect) between batches.\n9. Watch for signs of sickness.\n10. Vaccinate against diseases."
    }
  ];

  int _expandedIndex = -1; // Track expanded item; -1 if none are expanded

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagementModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Management',
      color: FlutterFlowTheme.of(context).primary.withAlpha(0xFF),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderRadius: 40,
              buttonSize: 40,
              icon: Icon(
                Icons.chevron_left_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 40,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            title: AutoSizeText(
              FFLocalizations.of(context).getText(
                'w6zqmj7g' /* SIVYHAM AGRICULTURE TECHNOLOGY */,
              ),
              maxFontSize: 16,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineMediumFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).headlineMediumFamily),
                  ),
            ),
            actions: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: AuthUserStreamWidget(
                    builder: (context) => StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.where(
                          'uid',
                          isEqualTo: currentUserUid,
                        ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitThreeBounce(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> circleImageUsersRecordList =
                            snapshot.data!;
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final circleImageUsersRecord =
                            circleImageUsersRecordList.isNotEmpty
                                ? circleImageUsersRecordList.first
                                : null;

                        return Container(
                          width: 50,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            currentUserPhoto,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 4,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'tn5mczkg' /* Frequently Asked Questions */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineSmallFamily),
                              ),
                    ),
                    const SizedBox(height: 16), // Additional space below header
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _expandedIndex =
                                  _expandedIndex == index ? -1 : index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  offset: Offset(0, 2),
                                  blurRadius: 0.0,
                                ),
                              ],
                            ),
                            child: ExpandablePanel(
                              controller: ExpandableController(
                                initialExpanded: _expandedIndex == index,
                              ),
                              header: Text(
                                item['question']!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              collapsed: Container(),
                              expanded: Text(
                                item['answer']!,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              theme: ExpandableThemeData(
                                hasIcon: true,
                                tapHeaderToExpand: true,
                                tapBodyToCollapse: true,
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
