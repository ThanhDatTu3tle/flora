import 'package:firebase_auth/firebase_auth.dart';
import 'package:flora/screens/sign_in/components/sign_form.dart';
import 'package:flora/screens/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../../constants.dart';
import '../../size_config.dart';
import '../sign_in/sign_in_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static String routeName = "/account";

  Future<String> uploadImageToFirebase(File imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child('avatars/$fileName');
    UploadTask uploadTask = reference.putFile(imageFile);
    TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => null);
    String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'avatarUrl': imageUrl});
    }
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/User.png",
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        PickedFile? pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          File imageFile = File(pickedFile.path);
                          String imageUrl = await uploadImageToFirebase(imageFile);

                          // FirebaseFirestore.instance.collection('users').doc(userId!).update({'avatarUrl': imageUrl});
                          String? userId = FirebaseAuth.instance.currentUser?.uid;
                          if (userId != null) {
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(userId)
                                .update({'avatarUrl': imageUrl});
                          }
                        }
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kPrimaryColor,
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                user?.displayName ?? user?.email ?? "",
                style: const TextStyle(
                    fontSize: 16.0
                ),
              ),
              // const Text(
              //   "@Ngdakkhoa01",
              //   style: TextStyle(
              //     fontSize: 18.0
              //   ),
              // ),
              const SizedBox(height: 5),
              SizedBox(
                width: 222,
                child: ElevatedButton(
                    onPressed: () async {
                      PickedFile? pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        File imageFile = File(pickedFile.path);
                        String imageUrl = await uploadImageToFirebase(imageFile);
                        // Cập nhật thông tin người dùng với đường dẫn hình ảnh mới
                        // Ví dụ: Firestore.instance.collection('users').doc(userId).update({'avatarUrl': imageUrl});
                      }

                      Navigator.pushNamed(context, UserProfile.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()
                    ),
                    child: null,
                    // child: const Text("Chỉnh sửa hồ sơ", style: TextStyle(color: Colors.white, fontSize: 16.0)),
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
                onPress: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(
                    context,
                    SignInScreen.routeName,
                  );
                },
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

