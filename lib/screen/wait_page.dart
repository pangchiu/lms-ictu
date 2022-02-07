import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/screen/login_page.dart';
import 'package:lms/text_style.dart';

class WaitPage extends StatefulWidget {
  const WaitPage({Key? key}) : super(key: key);

  @override
  State<WaitPage> createState() => _WaitPageState();
}

class _WaitPageState extends State<WaitPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 110),
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/logo.png',color: kPrimaryColor,)),
            ),
            SizedBox(
              height: 55,
              width: 230,
              child: Stack(
                children: [
                    const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child:  Text(
                      'LMS ICTU',
                      style: kStyleLogo,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 35,
                      child: SvgPicture.asset('assets/images/diamond.svg')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
