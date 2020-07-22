import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/app/models/user_model.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/database.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/app/settings/edit_array_tile.dart';
import 'package:twoGeeks/app/settings/education_levels.dart';
import 'package:twoGeeks/app/settings/show_tile.dart';
import 'package:twoGeeks/app/settings/subSettingHeaders.dart';
import 'package:twoGeeks/common_widgets/platform_exception_alert_dialog.dart';
import 'package:twoGeeks/app/settings/edit_text_tile.dart';
import 'package:twoGeeks/app/settings/edit_number_tile.dart';
import 'package:twoGeeks/app/settings/custom_dropdown_tile.dart';
import 'package:twoGeeks/app/settings/AddPhoto.dart';

/* Edit User Profile */
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Database database;

  void _getUid() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    User user = await auth.currentUser();
    if (mounted) {
      setState(() {
        database = FireStoreDatabase(uid: user.uid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff0f6f4),
        body: Column(children: <Widget>[
          subSettingHeader("Edit User Profile", context),
          _buildUserProfileForm(),
        ]));
  }

  void _updateName(String name) async {
    try {
      await database.updateProfile("name", name);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  void _updateAboutMe(String aboutMe) async {
    try {
      await database.updateProfile("aboutMe", aboutMe);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  void _updateAge(int age) async {
    try {
      await database.updateProfile("age", age.toString());
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  void _updateGrade(String grade) async {
    try {
      await database.updateProfile("currentSchoolYear", grade);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  void _updateGender(String gender) async {
    try {
      await database.updateProfile("gender", gender);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  void _updateProfilePicture(String url) async {
    try {
      await database.updateProfile("profilePic", url);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  void _updateStrength(List<dynamic> newStrengths) async {
    try {
      await database.updateProfile("strength", newStrengths);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  void _updateWeakness(List<dynamic> newWeakness) async {
    try {
      await database.updateProfile("weakness", newWeakness);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  void _updateHobbies(List<dynamic> newHobby) async {
    try {
      await database.updateProfile("hobbies", newHobby);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  Widget _buildUserProfileForm() {
    _getUid();
    return StreamBuilder<UserModel>(
        stream: database.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.network(
                            snapshot.data.profilePic,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      width: 1,
                                      color: Colors.black54.withOpacity(0.2),

                                    ))),
                                  )
                                ],
                              );
                            },
                          ),
                          ShowTile(
                            title: "Change Profile Picture",
                            iconData: Icons.camera_alt,
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPhoto(
//                                          updateImgUrl: _updateProfilePicture,
                                        ))),
                          ),
                        ],
                      ),
                      EditTextTile(
                        title: "Name",
                        subtitle: snapshot.data.name,
                        onSubmit: _updateName,
                        maxLength: 35,
                        maxLines: 1,
                        validator: (text) {
                          if (text.length < 3) {
                            return "Name must be at least 3 characters long";
                          }
                          return null;
                        },
                      ),
                      EditNumberTile(
                        title: "Age",
                        subtitle: snapshot.data.age.toString(),
                        onSubmit: _updateAge,
                      ),
                      CustomDropdownTile(
                        title: "Gender",
                        subtitle: snapshot.data.gender,
                        list: ["neutral", "male", "female"],
                        onSubmit: _updateGender,
                      ),
                      CustomDropdownTile(
                        title: "Educational level",
                        subtitle: snapshot.data.currentSchoolYear,
                        list: EducationLevel.education,
                        onSubmit: _updateGrade,
                      ),
                      EditTextTile(
                        title: "About me",
                        subtitle: snapshot.data.aboutMe,
                        onSubmit: _updateAboutMe,
                        maxLength: 140,
                        maxLines: 6,
                        validator: (text) {
                          return null;
                        },
                      ),
                      EditArrayTile(
                        title: "Strengths",
                        array: snapshot.data.strength,
                        onSubmit: _updateStrength,
                        helperText: "Add a new strength",
                        tagFontSize: 15,
                      ),
                      EditArrayTile(
                        title: "Weakness",
                        array: snapshot.data.weakness,
                        onSubmit: _updateWeakness,
                        helperText: "Add a new weakness",
                        tagFontSize: 15,
                      ),
                      EditArrayTile(
                        title: "Hobbies",
                        array: snapshot.data.hobbies,
                        onSubmit: _updateHobbies,
                        helperText: "Add a new hobby",
                        tagFontSize: 15,
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
