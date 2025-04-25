import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/create%20account/create_account.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class EnterAddressScreen extends StatefulWidget {
  const EnterAddressScreen({super.key});

  @override
  _EnterAddressScreenState createState() => _EnterAddressScreenState();
}

class _EnterAddressScreenState extends State<EnterAddressScreen> {
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _streetNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  bool isButtonActive = false;
  bool isButtonClicked = false;
  String buttonText = "Done";

  void _validateFields() {
    setState(() {
      isButtonActive =
          _houseNumberController.text.isNotEmpty &&
          _streetNumberController.text.isNotEmpty &&
          _cityController.text.isNotEmpty &&
          _postalCodeController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _houseNumberController.addListener(_validateFields);
    _streetNumberController.addListener(_validateFields);
    _cityController.addListener(_validateFields);
    _postalCodeController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _houseNumberController.dispose();
    _streetNumberController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
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
                "Enter your address",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(_houseNumberController, "House number"),
            const SizedBox(height: 10),
            _buildTextField(_streetNumberController, "Street number"),
            const SizedBox(height: 10),
            _buildTextField(_cityController, "City"),
            const SizedBox(height: 10),
            _buildTextField(_postalCodeController, "Postal code"),
            const SizedBox(height: 20),
            // Done Button
            CustomButton(
              isActive: isButtonActive,
              isClicked: isButtonClicked,
              label: buttonText,
              onPressed: () {
                setState(() {
                  buttonText = "Done"; // 🔥 Change it dynamically
                });

                // Simulate async behavior
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountCreatedScreen(),
                    ),
                  );
                  setState(() {
                    buttonText = "Done"; // Reset label if needed
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textfieldcolor,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.textGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: AppColors.white),
    );
  }
}
