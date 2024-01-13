import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hockey/theme/app_colors.dart';
import 'package:hockey/theme/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  List<MatchData> matches = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  Future<void> fetchMatches() async {
    final apiUrl = 'https://api.openligadb.de/getmatchdata/bl1/2023';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      setState(() {
        matches = data.map((event) => MatchData.fromMap(event)).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load matches');
    }
  }

  int? _index = 0;
  PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final Color background = AppColors.accent2;
    final Color fill = AppColors.accent;
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    final double fillPercent = 90;
    final double fillStop = (5 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return Scaffold(
      appBar: CustomAppBar(context, 'Matches'),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    itemCount: matches.length,
                    controller: _pageController,
                    onPageChanged: (index) => setState(() => _index = index),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AnimatedPadding(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.fastOutSlowIn,
                        padding: EdgeInsets.all(_index == index ? 0.0 : 8.0),
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                              colors: gradient,
                              stops: stops,
                              end: Alignment.centerRight,
                              begin: Alignment.bottomCenter,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 15.0,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Ligue des champions',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '60 : 22',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildTeamColumn(
                                        '${matches[index].iconTeam1}',
                                        '${matches[index].team1}',
                                        25),
                                    _buildScore(
                                        '${matches[index].matchResults[0].pointsTeam1} - ${matches[index].matchResults[0].pointsTeam2}'),
                                    _buildTeamColumn(
                                        '${matches[index].iconTeam2}',
                                        '${matches[index].team2}',
                                        25),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Matches',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.white),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: matches.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.surface2,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        SizedBox(width: 5),
                                        Text(
                                          '${matches[index].date}',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
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
                                        SizedBox(width: 5),
                                        Text(
                                          '${matches[index].time}',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Match',
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          width: 35,
                                          child: Text(
                                            '${matches[index].matchType}',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildTeamColumn(
                                        '${matches[index].iconTeam1}',
                                        '${matches[index].team1}',
                                        15),
                                    _buildScore('VS'),
                                    _buildTeamColumn(
                                        '${matches[index].iconTeam2}',
                                        '${matches[index].team2}',
                                        15),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildScore(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildTeamColumn(String iconUrl, String teamName, double radius) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: _loadImage(iconUrl),
          radius: radius,
        ),
        SizedBox(height: 10),
        Container(
          width: 70,
          child: Text(
            teamName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11.0,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  ImageProvider _loadImage(String imageUrl) {
    try {
      if (imageUrl.toLowerCase().endsWith('.svg')) {
        return AssetImage('assets/icons/appIcon.png');
      } else {
        return NetworkImage(imageUrl);
      }
    } catch (e) {
      print('Error loading image: $e');
      return AssetImage('assets/icons/appIcon.png');
    }
  }
}

class MatchData {
  final String team1;
  final String iconTeam1;
  final String team2;
  final String iconTeam2;
  final String matchType;
  final String date;
  final String time;
  final List<Result> matchResults;

  MatchData({
    required this.team1,
    required this.iconTeam1,
    required this.team2,
    required this.iconTeam2,
    required this.matchType,
    required this.date,
    required this.time,
    required this.matchResults,
  });

  factory MatchData.fromMap(Map<String, dynamic> map) {
    final matchDateTime = map['matchDateTime'] ?? '';
    final dateTime = DateTime.tryParse(matchDateTime);

    List<Result> results = [];
    if (map['matchResults'] != null) {
      results = List.from(map['matchResults'])
          .map((resultMap) => Result.fromMap(resultMap))
          .toList();
    }

    return MatchData(
      team1: map['team1']['teamName'] ?? '',
      iconTeam1: map['team1']['teamIconUrl'] ?? '',
      team2: map['team2']['teamName'] ?? '',
      iconTeam2: map['team2']['teamIconUrl'] ?? '',
      matchType: map['leagueName'] ?? '',
      matchResults: results,
      date: dateTime != null ? DateFormat('yyyy-MM-dd').format(dateTime) : '',
      time: dateTime != null ? DateFormat('h:mm a').format(dateTime) : '',
    );
  }
}

class Result {
  final int pointsTeam1;
  final int pointsTeam2;

  Result({
    required this.pointsTeam1,
    required this.pointsTeam2,
  });

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      pointsTeam1: map['pointsTeam1'] ?? 0,
      pointsTeam2: map['pointsTeam2'] ?? 0,
    );
  }
}
