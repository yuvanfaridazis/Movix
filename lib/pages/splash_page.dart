part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    new Future.delayed(Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_logo.png')
              )
            ),
          ),
        ),
      ),
    );
  }


}
