import 'package:flutter/material.dart';
import 'package:mobile_project/pages/HomePage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  screenState createState() => screenState();
}
class screenState extends State<SplashScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  final List<Map<String, String>> Data = [
    {
      "image": "https://media.istockphoto.com/id/1430405496/photo/blank-yellow-takeaway-cup-of-coffee-with-a-brown-lid-glazed-donut-with-pink-icing-with.webp?a=1&b=1&s=612x612&w=0&k=20&c=DdxoTj0PXb5qbJMLTpV2-MhUloNh_cU9oD_pcjBqcTA=",
      "title": "Welcome to Our App",
      "description": "Your coffee and donuts as you like.",
    },
    {
      "image": "https://media.istockphoto.com/id/1434198994/photo/donuts-with-pink-icing-served-with-coffee.webp?a=1&b=1&s=612x612&w=0&k=20&c=ZM56BPwLpkYO9Dt1DuiYHsAmYrtAAxAbLJ6SuCIxnMo=",
      "title": "Find best coffee",
      "description": "asxakljdlkajsdlaw",
    },
    {
      "image": "https://media.istockphoto.com/id/182735543/photo/close-up-of-a-cup-of-black-coffee-and-a-glazed-donut.webp?a=1&b=1&s=612x612&w=0&k=20&c=aJSA3J0hpQOD277V5apfGSGFt3OemDJXm5Mqmz0I6lI=",
      "title": "Get Started",
      "description": "Sign in now and start your amazing journey!",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (int index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: Data.length,
            itemBuilder: (context, index) => Content(
              image: Data[index]["image"]!,
              title: Data[index]["title"]!,
              description: Data[index]["description"]!,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage != 0)
                  TextButton(
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                Row(
                  children: List.generate(
                    Data.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8.0,
                      width: currentPage == index ? 8.0 : 8.0,
                      decoration: BoxDecoration(
                        color: currentPage == index ? Colors.black : Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                if (currentPage != Data.length - 1)
                  TextButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homepage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF129575),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String image, title, description;
  const Content({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(image, height: 300),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
