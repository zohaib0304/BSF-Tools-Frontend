import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/create%20account/address.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class EnterContactScreen extends StatefulWidget {
  const EnterContactScreen({super.key});

  @override
  _EnterContactScreenState createState() => _EnterContactScreenState();
}

class _EnterContactScreenState extends State<EnterContactScreen> {
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool isButtonActive = false;
  bool isButtonClicked = false;
  String buttonText = "Next";

  void _validateFields() {
    setState(() {
      isButtonActive =
          _countryCodeController.text.isNotEmpty &&
          _phoneNumberController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _countryCodeController.addListener(_validateFields);
    _phoneNumberController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _countryCodeController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: AppColors.white, size: 28),
            ),

            const SizedBox(height: 40),
            Center(
              child: Text(
                "Enter your contact number",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                // Country Code Field
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: _countryCodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textfieldcolor,
                      hintText: "XX",
                      hintStyle: const TextStyle(color: AppColors.textGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                // Phone Number Field
                Expanded(
                  child: TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textfieldcolor,
                      hintText: "XXX XXX XXXX",
                      hintStyle: const TextStyle(color: AppColors.textGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Next Button
            CustomButton(
              isActive: isButtonActive,
              isClicked: isButtonClicked,
              label: buttonText,
              onPressed: () {
                setState(() {
                  buttonText = "Next"; // 🔥 Change it dynamically
                });

                // Simulate async behavior
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnterAddressScreen(),
                    ),
                  );
                  setState(() {
                    buttonText = "Next"; // Reset label if needed
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
