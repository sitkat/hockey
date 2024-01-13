import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../data/database_helper.dart';
import '../theme/app_colors.dart';
import 'navigation_screen.dart';

class AddMatchScreen extends StatefulWidget {
  const AddMatchScreen({super.key});

  @override
  State<AddMatchScreen> createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
  final formFieldFirstTeam = TextEditingController();
  final formFieldSecondTeam = TextEditingController();
  final formFieldDateTimeTeam = TextEditingController();
  DateTime? dateTime;
  String formattedDateTime = '';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.accent,
            onPressed: () {
              Navigator.pop(context, 'MatchScreen');
            },
          ),
          title: Text(
            'Back',
            style: TextStyle(color: AppColors.accent, fontSize: 13.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  'Nom de l\'équipe première',
                  style: TextStyle(
                    color: AppColors.whiteWithOpacity,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 10),
                AppTextField(
                  controller: formFieldFirstTeam,
                ),
                SizedBox(height: 10),
                Text(
                  'Nom de l\'équipe secondaire',
                  style: TextStyle(
                    color: AppColors.whiteWithOpacity,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 10),
                AppTextField(
                  controller: formFieldSecondTeam,
                ),
                SizedBox(height: 10),
                Text(
                  'Choisir la date et l\'heure',
                  style: TextStyle(
                    color: AppColors.whiteWithOpacity,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    showDateTimePicker();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: AppColors.surface2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/Calendar.png',
                          ),
                          SizedBox(width: 10),
                          Text(
                            formattedDateTime,
                            style: TextStyle(color: AppColors.accent),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () async {
                      if (formKey.currentState?.validate() != true ||
                          formattedDateTime.isEmpty) {
                        return;
                      } else {
                        await saveMatchToDatabase();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavigationScreen(initialTabIndex: 2),
                          ),
                        );
                      }
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
          ),
        ),
      ),
    );
  }

  Future<void> saveMatchToDatabase() async {
    final database = await DatabaseHelper.instance.database;

    final firstTeam = formFieldFirstTeam.text;
    final secondTeam = formFieldSecondTeam.text;

    if (dateTime != null) {
      final date = DateFormat('yyyy-MM-dd').format(dateTime!);
      final time = DateFormat('hh:mm a').format(dateTime!);

      await database.insert('Match', {
        'firstTeam': firstTeam,
        'secondTeam': secondTeam,
        'date': date,
        'time': time,
      });
    }
  }

  showDateTimePicker() async {
    DateTime? result = await showOmniDateTimePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      lastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
    );
    if (result != null) {
      setState(() {
        dateTime = result;
        formattedDateTime = DateFormat('yyyy-MM-dd hh:mm a').format(result);
      });
    }
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField(
      {required this.controller, this.keyboardType = TextInputType.text})
      : super();

  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          maxLines: 1,
          style: TextStyle(color: AppColors.accent),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }

  String? validator(String? value) {
    if (value?.isEmpty == true) {
      return "Obligatory field";
    }
    return null;
  }
}
