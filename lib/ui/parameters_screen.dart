import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hockey/theme/app_colors.dart';
import 'package:hockey/theme/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ParametersScreen extends StatefulWidget {
  const ParametersScreen({Key? key}) : super(key: key);

  @override
  State<ParametersScreen> createState() => _ParametersScreenState();
}

class _ParametersScreenState extends State<ParametersScreen> {
  bool? notifyVal;
  late SharedPreferences prefs;

  @override
  void initState() {
    loadPreferences();
    super.initState();
  }

  Future<void> loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      notifyVal = prefs.getBool('isNotify');
    });
  }

  _storeIsNotifyInfo(bool val) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isNotify', val);
    setState(() {
      notifyVal = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'Paramètres'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      color: AppColors.params,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 0.9,
                  child: CupertinoSwitch(
                    activeColor: AppColors.accent,
                    trackColor: Colors.grey,
                    value: notifyVal ?? false,
                    onChanged: (bool newValue) {
                      setState(() {
                        _storeIsNotifyInfo(newValue);
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            _buildParam('assets/icons/params/Privacy.png',
                'Politique de confidentialité', 'https://google.com'),
            SizedBox(height: 25),
            _buildParam('assets/icons/params/Paper.png',
                'Conditions d\'utilisation', 'https://google.com'),
            SizedBox(height: 25),
            _buildParam('assets/icons/params/Bag.png',
                'Informations sur l\'abonnement', 'https://google.com'),
            SizedBox(height: 25),
            _buildParam('assets/icons/params/Rate.png', 'Évaluer l\'appli',
                'https://google.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildParam(String icon, String text, String uri) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(uri);
        await launchUrl(url);
      },
      child: Row(
        children: [
          Image.asset(
            icon,
          ),
          SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
