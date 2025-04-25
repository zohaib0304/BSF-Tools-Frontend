import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/home%20screens/Profile/ProfileScreen.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Edit address",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Form fields scrollable
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTextField(_houseNumberController, "House number"),
                      const SizedBox(height: 10),
                      _buildTextField(_streetNumberController, "Street number"),
                      const SizedBox(height: 10),
                      _buildTextField(_cityController, "City"),
                      const SizedBox(height: 10),
                      _buildTextField(_postalCodeController, "Postal code"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Done Button at Bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: CustomButton(
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
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              setState(() {
                buttonText = "Done"; // Reset label if needed
              });
            });
          },
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
