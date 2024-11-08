class UserModel {
  final int? id;
  final String? email;
  final String? password;
  final DateTime? birthday;
  final String? gender;
  final double? height;
  final double? currentWeight;
  final double? goalWeight;
  final String? activityLevel;
  final String? myDiet;
  final String? goalCalories;
  final String? goalMacronutrients;
  final List<String>? medicalConditions;
  final String? profileImage;
  final String? subscriptionStatus;
  final String? userName;
  final String? userSurname;
  final String? uuid;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.birthday,
    this.gender,
    this.height,
    this.currentWeight,
    this.goalWeight,
    this.activityLevel,
    this.myDiet,
    this.goalCalories,
    this.goalMacronutrients,
    this.medicalConditions,
    this.profileImage,
    this.subscriptionStatus,
    this.userName,
    this.userSurname,
    this.uuid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      birthday: json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      gender: json['gender'],
      height: json['height']?.toDouble(),
      currentWeight: json['current_weight']?.toDouble(),
      goalWeight: json['goal_weight']?.toDouble(),
      activityLevel: json['activity_level'],
      myDiet: json['my_diet'],
      goalCalories: json['goal_calories'],
      goalMacronutrients: json['goal_macronutrients'],
      medicalConditions: json['medical_conditions'] != null
          ? List<String>.from(json['medical_conditions'])
          : null,
      profileImage: json['profile_image'],
      subscriptionStatus: json['subscription_status'],
      userName: json['user_name'],
      userSurname: json['user_surname'],
      uuid: json['uuid'],
    );
  }
}
