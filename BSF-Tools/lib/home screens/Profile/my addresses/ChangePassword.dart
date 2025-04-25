import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/home%20screens/Profile/ProfileScreen.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangePasswordScreen(),
    ),
  );
}

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool get _isFormValid =>
      _currentPasswordController.text.isNotEmpty &&
      _newPasswordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty &&
      _newPasswordController.text == _confirmPasswordController.text;
  bool isButtonClicked = false;
  String buttonText = "Save";

  void _onChanged() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _currentPasswordController.addListener(_onChanged);
    _newPasswordController.addListener(_onChanged);
    _confirmPasswordController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back, color: AppColors.white),
              ),
              SizedBox(height: 16),
              Text(
                "Change password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 32),
              _buildPasswordField(
                "Enter current password",
                _currentPasswordController,
              ),
              SizedBox(height: 16),
              _buildPasswordField("Enter new password", _newPasswordController),
              SizedBox(height: 16),
              _buildPasswordField(
                "Confirm password",
                _confirmPasswordController,
              ),
              Spacer(),
              CustomButton(
                isActive: _isFormValid,
                isClicked: isButtonClicked,
                label: buttonText,
                onPressed: () {
                  setState(() {
                    buttonText = "Save"; // 🔥 Change it dynamically
                  });

                  // Simulate async behavior
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                    setState(() {
                      buttonText = "Save"; // Reset label if needed
                    });
                  });
                },
              ),
              SizedBox(height: mediaQuery.padding.bottom + 10),
            ],
          ),
        ),
      ),
    );
  }

  //_isFormValid
  Widget _buildPasswordField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      style: TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.textGrey),
        filled: true,
        fillColor: AppColors.textfieldcolor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      ),
    );
  }
}
