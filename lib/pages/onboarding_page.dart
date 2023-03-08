part of 'pages.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController();

  List<String> listTitle = [
    'Favourite Movie',
    'Snack Order',
    'Trailer Play'
  ];

  List<String> listSubtitle = [
    'Feel the easy experience of getting\nthe latest movie tickets in just one click',
    'Dont worry about starving when you watching the movie, let’s order some snacks in-app',
    'Confused about choosing a movie?\nSo lets watch the trailer in-app firstly'
  ];

  List<String> listImagePath = [
    'assets/img_intro_1.png',
    'assets/img_intro_2.png',
    'assets/img_intro_3.png'
  ];

  List<String> listButtonText = [
    'Next Slide',
    'Next Slide',
    'Get Started'
  ];

  int index = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value){
                    setState(() {
                      index = value;
                    });
                  },
                  children: listTitle.map((e) => Column(
                    children: [
                      SizedBox(height: 100),
                      Container(
                        alignment: Alignment.center,
                        width: 270,
                        height: 270,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(listImagePath[index])
                            )
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(listTitle[index], style: GoogleFonts.poppins(fontSize: 24, color: blackColor, fontWeight: FontWeight.w600)),
                      SizedBox(height: 10),
                      Text(listSubtitle[index], textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 14, color: blackLightColor)),
                      SizedBox(height: 15),
                    ],
                  )).toList(),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dotsItem((index == 0) ? true : false),
                      SizedBox(width: 8,),
                      dotsItem((index == 1) ? true : false),
                      SizedBox(width: 8,),
                      dotsItem((index == 2) ? true : false),
                    ],
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    onPressed: (){

                      if(index >= 2){
                        setState((){
                          index = 0;
                        });
                      } else {
                        setState((){
                          index++;
                        });
                      }

                      pageController.jumpToPage(index);

                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 2*20,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(listButtonText[index], style: GoogleFonts.poppins(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dotsItem(bool isActive){
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (isActive == true) ? mainColor : greyColor
      ),
    );
  }
}
