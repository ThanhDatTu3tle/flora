import 'package:flora/screens/account/account_screen.dart';
import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import '../../constants.dart';
import '../../size_config.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  static const routeName = '/profile';


  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: const Text(
          "Hồ sơ cá nhân",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
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
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Họ và tên",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // const SizedBox(height: 5),
                    const TextField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: kPrimaryColor),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // const SizedBox(height: 5),
                    const TextField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: kPrimaryColor),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      "Số điện thoại",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // const SizedBox(height: 5),
                    const TextField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: kPrimaryColor),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      "Ngày sinh",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // const SizedBox(height: 5),
                    const TextField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: kPrimaryColor),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      "Giới tính",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const TextField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: kPrimaryColor),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),
                    DefaultButton(
                      text: "Lưu",
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          Navigator.pushNamed(context, AccountScreen.routeName);
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
