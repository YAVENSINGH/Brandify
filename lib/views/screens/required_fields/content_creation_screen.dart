import 'package:flutter/material.dart';

class ContentCreationScreen extends StatefulWidget {
  const ContentCreationScreen({super.key});

  @override
  _ContentCreationScreenState createState() => _ContentCreationScreenState();
}

class _ContentCreationScreenState extends State<ContentCreationScreen> {
  String? _selectedContentType;
  final List<String> _contentTypes = ["Posts", "Images", "Videos", "Stories"];
  final TextEditingController _keywordsController = TextEditingController();
  final TextEditingController _strategyController = TextEditingController();
  final TextEditingController _guidelinesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _keywordsController.dispose();
    _strategyController.dispose();
    _guidelinesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.5,
            colors: [Color(0xFF7B1FA2), Colors.black],
          ),
        ),
        child:SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderSection(),
                        const SizedBox(height: 25),
                        _buildDropdownField(),
                        _buildTextField("Keywords", controller: _keywordsController),
                        _buildTextField("Content strategy (if any)", controller: _strategyController),
                        _buildTextField("Guidelines (if any)", controller: _guidelinesController, maxLines: 3),
                        const SizedBox(height: 40),
                        _buildNextButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tell more about\ncontent creation",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "\"Give more details about content to create using AI effortlessly with precision\"",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[300],
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: DropdownButtonFormField<String>(
          value: _selectedContentType,
          hint: const Text("Type of content", style: TextStyle(color: Colors.grey)),
          dropdownColor: Colors.black,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          style: const TextStyle(color: Colors.white, fontSize: 16),
          items: _contentTypes.map((String type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedContentType = newValue;
            });
          },
          validator: (value) => value == null ? 'Please select content type' : null,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {required TextEditingController controller, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        validator: (value) => value?.isEmpty ?? true ? 'This field is required' : null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.purpleAccent,
        maxLines: maxLines,
      ),
    );
  }

  Widget _buildNextButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NextScreen(),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.purpleAccent,
          shadowColor: Colors.purpleAccent.withOpacity(0.5),
          elevation: 10,
        ),
        child: const Text(
          "Next",
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Next Screen'),
      ),
    );
  }
}
