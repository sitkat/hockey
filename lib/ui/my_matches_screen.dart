import 'package:flutter/material.dart';
import 'package:hockey/ui/add_match_screen.dart';

import '../data/database_helper.dart';
import '../theme/app_colors.dart';
import '../theme/custom_app_bar.dart';

class MyMatchesScreen extends StatefulWidget {
  const MyMatchesScreen({super.key});

  @override
  State<MyMatchesScreen> createState() => _MyMatchesScreenState();
}

class _MyMatchesScreenState extends State<MyMatchesScreen> {
  List<Map<String, dynamic>> matchData = [];

  Future<void> _fetchMatchData() async {
    final List<Map<String, dynamic>> result =
        await DatabaseHelper.instance.fetchMatchData();
    setState(() {
      matchData = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchMatchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'Mes matches'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: matchData.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pas d\'information sur les matchs',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Cliquez sur le "Add matches" bouton',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: AppColors.whiteWithOpacity,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddMatchScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add matches',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: matchData.length,
                itemBuilder: (context, index) {
                  final matchItem = matchData[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: AppColors.surface2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    '${matchItem['date']}',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: AppColors.accent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Temps',
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    '${matchItem['time']}',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: AppColors.accent,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'VS',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${matchItem['firstTeam']}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '${matchItem['secondTeam']}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: Visibility(
        visible: matchData.isNotEmpty,
        child: FloatingActionButton(
          backgroundColor: AppColors.accent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddMatchScreen(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
    );
  }
}
