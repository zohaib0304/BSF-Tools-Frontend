import 'dart:io';
import 'package:bsf/App%20Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiscountsScreen extends StatefulWidget {
  const DiscountsScreen({super.key});

  @override
  State<DiscountsScreen> createState() => _DiscountsScreenState();
}

class _DiscountsScreenState extends State<DiscountsScreen> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  final categoryController = TextEditingController();
  final brandNameController = TextEditingController();
  final productNameController = TextEditingController();
  final originalPriceController = TextEditingController();
  final discountedPriceController = TextEditingController();
  final productDescriptionController = TextEditingController();

  final List<XFile> _images = [];

  bool get isFormValid {
    return categoryController.text.isNotEmpty &&
        brandNameController.text.isNotEmpty &&
        productNameController.text.isNotEmpty &&
        originalPriceController.text.isNotEmpty &&
        discountedPriceController.text.isNotEmpty &&
        productDescriptionController.text.isNotEmpty &&
        _images.isNotEmpty;
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _images.add(pickedFile));
    }
  }

  @override
  void dispose() {
    categoryController.dispose();
    brandNameController.dispose();
    productNameController.dispose();
    originalPriceController.dispose();
    discountedPriceController.dispose();
    productDescriptionController.dispose();
    super.dispose();
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        labelText: label, // <--- Use labelText instead of hintText
        labelStyle: const TextStyle(color: AppColors.textGrey),
        filled: true,
        fillColor: AppColors.textfieldcolor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      onChanged: (_) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Discounts',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 12),
              _buildTextField('Category', categoryController),
              const SizedBox(height: 12),
              _buildTextField('Brand name', brandNameController),
              const SizedBox(height: 12),
              _buildTextField('Product name', productNameController),
              const SizedBox(height: 12),
              _buildTextField('Original price', originalPriceController),
              const SizedBox(height: 12),
              _buildTextField('Discounted price', discountedPriceController),
              const SizedBox(height: 12),
              _buildTextField(
                'Product description',
                productDescriptionController,
              ),
              const SizedBox(height: 16),

              // Add Image Button
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.add, color: AppColors.white),
                label: Text(
                  _images.isEmpty ? 'Add image' : 'Add another image',
                  style: const TextStyle(color: AppColors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.transparent,
                  side: const BorderSide(color: AppColors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Show picked image(s)
              if (_images.isNotEmpty)
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children:
                      _images.map((img) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(img.path),
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),

      // Save Button
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 50,
        child: ElevatedButton(
          onPressed:
              isFormValid
                  ? () {
                    // Save product logic
                  }
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isFormValid ? AppColors.redcolor : AppColors.customgreycolor,
            disabledBackgroundColor: AppColors.customgreycolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Save',
            style: TextStyle(color: AppColors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
