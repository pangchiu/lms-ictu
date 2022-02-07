import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/component/text_filed_container.dart';
import 'package:lms/screen/home_page.dart';
import 'package:lms/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSave = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 2000),
            tween: Tween(begin: 0, end: 1),
            curve: Curves.fastOutSlowIn,
            builder: (context, value, child) {
              return SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child: SizedBox(
                          width: 200 - value * 90,
                          height: 200 - value * 90,
                          child: Image.asset(
                            'assets/images/logo.png',
                            color: kPrimaryColor,
                          )),
                    ),
                    Transform.translate(
                      offset: Offset(0, -value * 90),
                      child: SizedBox(
                        height: 55,
                        width: 230,
                        child: Stack(
                          children: [
                            const Positioned(
                              left: 0,
                              right: 0,
                              bottom: 10,
                              child: Text(
                                'LMS ICTU',
                                style: kStyleLogo,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 35,
                                child: SvgPicture.asset(
                                    'assets/images/diamond.svg')),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: value,
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              TextFiledContainer(
                                child: TextFormField(
                                  style: kStyle4,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  cursorColor: kPrimaryColor,
                                ),
                                label: const Text(
                                  'Tài Khoản',
                                  style: kStyle4,
                                ),
                                color: kBackgroundTextFiledColor,
                              ),
                              const SizedBox(height: 20),
                              TextFiledContainer(
                                child: TextFormField(
                                  style: kStyle4,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  cursorColor: kPrimaryColor,
                                ),
                                label: const Text(
                                  'Mật khẩu',
                                  style: kStyle4,
                                ),
                                color: kBackgroundTextFiledColor,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                        value: _isSave,
                                        activeColor: kPrimaryColor,
                                        onChanged: (save) {
                                          setState(() {
                                            _isSave = save!;
                                          });
                                        }),
                                  ),
                                  const Text('Lưu tài khoản và mật khẩu.',
                                      style: kStyle5),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: size.height * 0.08,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const HomePage(),
                                        ));
                                  },
                                  child: const Text('ĐĂNG NHẬP', style: kStyle1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
