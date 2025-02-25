import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/api.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final Api api = Api();
  bool _regularDonor = false;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController donationController = TextEditingController();

  File? _image;
  String? _selectedGender;
  String? _selectedBloodGroup;
  DateTime? _selectedDate;
  bool _isUploading = false;
  String? profile_picture;
  bool isApiHit = false;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }


  Future<void> fetchProfileData() async {
    if (!mounted) return;
    setState(() => isApiHit = true);

    try {
      var response = await api.getUserProfile();
      var profileData = response['user'] ?? response;


      print("Profile Data: $profileData");

      if (!mounted) return;

      setState(() {

        firstNameController.text = profileData['first_name'] ?? '';
        lastNameController.text = profileData['last_name'] ?? '';
        phoneController.text = profileData['phone_number'] ?? '';
        emailController.text = profileData['email'] ?? '';
        profile_picture = profileData['profile_picture'] ?? "";

        _selectedBloodGroup = profileData['blood_group'];
        bloodGroupController.text = _selectedBloodGroup ?? '';
        if (profileData['date_of_birth'] != null) {

          _selectedDate = DateTime.tryParse(profileData['date_of_birth']);
          dobController.text = _selectedDate != null
              ? "${_selectedDate!.year}/${_selectedDate!.month}/${_selectedDate!.day}"
              : 'Invalid Date';
        }

        if (profileData['last_blood_donation_date'] != null) {
          final lastDonationDate = DateTime.tryParse(profileData['last_blood_donation_date']);
          donationController.text = lastDonationDate != null
              ? "${lastDonationDate.year}/${lastDonationDate.month}/${lastDonationDate.day}"
              : 'Invalid Date';
        }
        _selectedGender = profileData['gender'];
        genderController.text = _selectedGender ?? '';
        addressController.text = profileData['address'] ?? '';
        _regularDonor = (profileData['regularDonor'] == "true");


        isApiHit = false;
      });
    } catch (e) {
      print("Error fetching profile: $e");
      if (mounted) {
        setState(() => isApiHit = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load profile: ${e.toString()}")),
        );
      }
    }


  }  Future<void> updateUserProfile() async {
    setState(() => _isUploading = true);

    try {
      try {
        if (_image != null) {
          String? newImageUrl = await api.uploadProfilePicture(_image!);
          if (newImageUrl != null) {
            setState(() => profile_picture = newImageUrl);
          }
        }
      } catch (e) {
        print("Image upload failed: $e");
      }


      var updatedData = {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "phone_number": phoneController.text,
        "email": emailController.text,
        "blood_group": _selectedBloodGroup ?? bloodGroupController.text,
        "date_of_birth": _selectedDate != null ? _selectedDate!.toString() : '',
        "gender": _selectedGender ?? genderController.text,
        "address": addressController.text,
        "last_blood_donation_date": donationController.text,
        "regularDonor": _regularDonor ? 1 : 0,
        "profile_picture": profile_picture,
       // "profile_picture": newImageUrl,
      };
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile Updated")),
      );
    } catch (e) {
      print("Error updating profile: $e");
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image == null) return;

      File imageFile = File(image.path);
      if (!await imageFile.exists()) return;

      // Crop the image immediately after picking
      File? croppedImage = await _cropImage(imageFile);
      if (croppedImage == null) return;

      if (mounted) {
        setState(() {
          _image = croppedImage;
        });
      }

      print("Image picked and cropped: ${croppedImage.path}");
    } catch (e) {
      print("Error picking image: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to pick image: ${e.toString()}")),
        );
      }
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Crop Image',
          ),
        ],
      );

      if (croppedFile == null) return null;
      return File(croppedFile.path);
    } catch (e) {
      print("Error cropping image: $e");
      return null;
    }
  }
  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Pick from Gallery"),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Take a Photo"),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1950, 1, 1),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate && mounted) {
      setState(() {
        _selectedDate = picked;
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Edit Profile")),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isApiHit
          ? Center(child: CircularProgressIndicator()) // Show loader while fetching
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: _showImagePicker,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: _image != null
                            ? FileImage(_image!) // Show locally picked image
                            : (profile_picture != null && profile_picture!.isNotEmpty
                            ? CachedNetworkImageProvider(profile_picture!)
                            : AssetImage("assets/default_avatar.png") as ImageProvider),
                        child: _image == null && profile_picture == null
                            ? Icon(Icons.camera_alt, size: 40)
                            : null,
                      ),
                    ),
                    if (_isUploading)
                      Positioned.fill(
                          child: CircularProgressIndicator()
                      ),
                  ],
                ),
              ),
              buildLabel("First Name *"),
              buildTextField(firstNameController),
              buildLabel("Last Name *"),
              buildTextField(lastNameController),
              buildLabel("Phone Number *"),
              buildTextField(phoneController),
              buildLabel("Email *"),
              buildTextField(emailController),
              buildLabel("Blood Group *"),
              buildBloodGroupDropdown(),
              buildLabel("Date of Birth *"),
              buildDateOfBirthPicker(),
              buildLabel("Gender *"),
              buildGenderDropdown(),
              buildLabel("Address *"),
              buildTextField(addressController),
              buildLabel("Last Donation Date *"),
              buildTextField(donationController),
              buildLabel("Regular Donor *"),
              buildRegularDonorSwitch(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: updateUserProfile,
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, {IconData? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.green),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.grey)
              : null,
        ),
      ),
    );
  }

  Widget buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        style: TextStyle(color: Colors.green),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        hint: Text("Select Gender"),
        items: ["Male", "Female", "Other"].map((String gender) {
          return DropdownMenuItem<String>(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (mounted) {
            setState(() {
              _selectedGender = newValue;
              genderController.text = newValue ?? '';
            });
          }
        },
      ),
    );
  }

  Widget buildBloodGroupDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButtonFormField<String>(
        value: _selectedBloodGroup,
        style: TextStyle(color: Colors.green),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        hint: Text("Select Blood Group"),
        items: ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"].map((String bloodGroup) {
          return DropdownMenuItem<String>(
            value: bloodGroup,
            child: Text(bloodGroup),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (mounted) {
            setState(() {
              _selectedBloodGroup = newValue;
              bloodGroupController.text = newValue ?? '';
            });
          }
        },
      ),
    );
  }

  Widget buildDateOfBirthPicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: TextField(
            controller: dobController,
            style: TextStyle(color: Colors.green),
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Select Date of Birth",
              suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRegularDonorSwitch() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Are you a regular donor?", style: TextStyle(fontSize: 16)),
          Switch(
            value: _regularDonor,
            onChanged: (bool newValue) {
              if (mounted) {
                setState(() {
                  _regularDonor = newValue;
                });
              }
            },
          ),
        ],
      ),
    );
  }}
