import 'package:flora/screens/user_profile/user_profile.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static String routeName = "/account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/HongTrang.png",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                  "Nguyễn Đăng Khoa",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Text(
                "@Ngdakkhoa01",
                style: TextStyle(
                  fontSize: 18.0
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 222,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, UserProfile.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor, side: BorderSide.none, shape: const StadiumBorder()
                    ),
                    child: const Text("Chỉnh sửa hồ sơ", style: TextStyle(color: Colors.white, fontSize: 16.0)),
                ),
              ),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Cài đặt",
                icon: Icons.settings,
                onPress: () {  },
              ),
              ProfileMenuWidget(
                title: "Trạng thái đơn hàng",
                icon: Icons.card_travel_outlined,
                onPress: () {  },
              ),
              ProfileMenuWidget(
                title: "Địa chỉ",
                icon: Icons.home_outlined,
                onPress: () {  },
              ),
              ProfileMenuWidget(
                title: "Phương thức thanh toán",
                icon: Icons.credit_score_outlined,
                onPress: () {  },
              ),
              ProfileMenuWidget(
                title: "Đăng xuất",
                icon: Icons.logout_outlined,
                onPress: () {  },
                endIcon: false,
                textColor: kPrimaryColor,
              )
            ],
          ),
        ),
      )
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100)
        ),
        child: Icon(
          icon,
          size: getProportionateScreenWidth(30),
          color: kPrimaryColor,
        ),
      ),
      title: Text(title, style: TextStyle(fontSize: 20.0, color: textColor)),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100)
        ),
        child: const Icon(Icons.arrow_forward_ios_outlined, size: 18.0, color: Colors.grey),
      ) : null,
    );
  }
}
