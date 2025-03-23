import 'package:flutter/material.dart';

class BrandDetailsScreen extends StatefulWidget {
  const BrandDetailsScreen({super.key});

  @override
  _BrandDetailsScreenState createState() => _BrandDetailsScreenState();
}

class _BrandDetailsScreenState extends State<BrandDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.black],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            _buildPageIndicator(),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: const [
                  DetailsPage(
                    title: "Describe your brand/company",
                    fields: [
                      "Name of brand/company",
                      "Tagline...",
                      "Mission statement..."
                    ],
                  ),
                  DetailsPage(
                    title: "Describe your brand/company",
                    fields: [
                      "Brand personality",
                      "Target audience",
                      "Brand story...",
                      "Goals/objective"
                    ],
                  ),
                  DetailScreenThree(),
                ],
              ),
            ),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 30 : 15,
          height: 5,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.pink : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/nextDetails');
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.purpleAccent,
        ),
        child: const Text("Next", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;
  final List<String> fields;

  const DetailsPage({super.key, required this.title, required this.fields});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text(
            "Define your brand in a nutshell. What sets it apart?",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ...fields.map((field) => BuildTextField(hint: field)).toList(),
        ],
      ),
    );
  }
}

class DetailScreenThree extends StatefulWidget {
  const DetailScreenThree({super.key});

  @override
  _DetailScreenThreeState createState() => _DetailScreenThreeState();
}

class _DetailScreenThreeState extends State<DetailScreenThree> {
  Color selectedColor = Colors.red;

  void _updateColor(Offset localPosition) {
    final double width = 280;
    final double dx = localPosition.dx.clamp(0, width);
    final double hue = (dx / width) * 360;
    setState(() {
      selectedColor = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Describe your brand/company",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "Define your brand in a nutshell. What sets it apart?",
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildUploadBox("Brand logo"),
              const SizedBox(width: 10),
              _buildUploadBox("Brand logo"),
            ],
          ),
          const SizedBox(height: 10),
          _buildUploadBox("Brand color palette", width: 280),
          const SizedBox(height: 10),
          const Text("OR", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10),
          const Text("Select colors", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10),
          _buildColorSlider(),
        ],
      ),
    );
  }

  Widget _buildUploadBox(String text, {double width = 120}) {
    return Container(
      width: width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image, color: Colors.white, size: 30),
            const SizedBox(height: 5),
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSlider() {
    return Column(
      children: [
        GestureDetector(
          onPanStart: (details) => _updateColor(details.localPosition),
          onPanUpdate: (details) => _updateColor(details.localPosition),
          onTapDown: (details) => _updateColor(details.localPosition),
          child: Container(
            width: 280,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
                  Colors.blue,
                  Colors.purple,
                ],
              ),
            ),
            child: CustomPaint(
              painter: SliderThumbPainter(selectedColor),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: selectedColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '#${selectedColor.value.toRadixString(16).substring(2)}',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

class SliderThumbPainter extends CustomPainter {
  final Color selectedColor;

  SliderThumbPainter(this.selectedColor);

  @override
  void paint(Canvas canvas, Size size) {
    final double hue = HSVColor.fromColor(selectedColor).hue;
    final double position = (hue / 360) * size.width;
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(position, size.height / 2), 8, paint);
  }

  @override
  bool shouldRepaint(covariant SliderThumbPainter oldDelegate) {
    return oldDelegate.selectedColor != selectedColor;
  }
}

class BuildTextField extends StatelessWidget {
  final String hint;

  const BuildTextField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          filled: true,
          fillColor: Colors.black,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.purple),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}