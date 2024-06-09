import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Controllers/Auth/Login.dart';
import 'package:kallcenter/Core/Class/StatusRequest.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';
import 'package:kallcenter/Core/Constante/ImagesApp.dart';
import 'package:kallcenter/Core/Function/validateInput.dart';
import 'package:kallcenter/Views/Screen/Loading.dart';
import 'package:kallcenter/Views/Widget/inputForm.dart';

class Login extends StatelessWidget {
  Login({super.key});
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      body: GetBuilder<LoginControllerImp>(
          init: LoginControllerImp(),
          builder: (controller) => controller.status == StatusRequest.loading
              ? Loading()
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        ///////////////////////////////logo//////////////////////////////
                        SizedBox(
                          height: controller.size.screenHeight! * 0.3,
                          child: Stack(children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: AnimatedOpacity(
                                opacity: activeIndex == 0 ? 1 : 0,
                                duration: const Duration(
                                  seconds: 1,
                                ),
                                curve: Curves.linear,
                                child: Image(
                                  image: ImagesApp.Logo,
                                  height: controller.size.screenHeight! * 0.4,
                                  width: controller.size.screenWidth! * 0.75,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: controller.size.screenHeight! * 0.03,
                        ),
                        //////////////////////////Title login/////////////////////////////
                        Container(
                          width: controller.size.screenWidth! * 0.7,
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: controller.size.fontSize! * 1.3,
                                  fontWeight: FontWeight.w900,
                                  color: ColorsApp.SecondColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: controller.size.screenHeight! * 0.05,
                        ),
                        //////////////////////////Input Email/////////////////////////////
                        InputForm(
                            labelText: "Email",
                            hintText: "Email",
                            iconData: Icons.person,
                            controller: controller.email,
                            validator: (vall) {
                              return validateInput(vall!, 50, 6, "email");
                            }),
                        SizedBox(
                          height: controller.size.screenHeight! * 0.03,
                        ),
                        //////////////////////////Input password/////////////////////////////
                        GetBuilder<LoginControllerImp>(
                          builder: (controlle) => InputForm(
                              labelText: "Mot de passe",
                              hintText: "Mot de passe",
                              iconData: Icons.password,
                              controller: controlle.password,
                              obscureText: controlle.showpassword,
                              iconsuffix: controlle.showpassword == true
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              onTap: controller.showpasswordfunction,
                              validator: (vall) =>
                                  validateInput(vall!, 50, 8, "password")),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        //////////////////////////button login/////////////////////////////
                        MaterialButton(
                          onPressed: () {
                            controller.login();
                          },
                          height: controller.size.screenHeight! * 0.06,
                          color: ColorsApp.SecondColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            "S'authentifier",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: controller.size.fontSize! * 0.8),
                          ),
                        ),
                        SizedBox(
                          height: controller.size.screenHeight! * 0.04,
                        ),
                        //////////////////////////button register/////////////////////////////
                        // Container(
                        //   width: controller.size.screenWidth! * 0.9,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         'Vous n\'avez pas encore un compte?',
                        //         style: TextStyle(
                        //             color: ColorsApp.white,
                        //             fontSize: controller.size.fontSize! * 0.65,
                        //             fontWeight: FontWeight.w400),
                        //       ),
                        //       TextButton(
                        //         onPressed: controller.gotopageSignup,
                        //         child: Text(
                        //           'S\'inscrire',
                        //           style: TextStyle(
                        //               color: Colors.blueAccent,
                        //               fontSize:
                        //                   controller.size.fontSize! * 0.65,
                        //               fontWeight: FontWeight.w400),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )),
    );
  }
}
