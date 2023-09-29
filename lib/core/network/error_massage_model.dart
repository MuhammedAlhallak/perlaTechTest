import 'package:equatable/equatable.dart';

class ErrorMassageModel extends Equatable {
  final List<String> data;
  final String message;

  const ErrorMassageModel({required this.message, required this.data});

  factory ErrorMassageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMassageModel(
      message: json['message'] ?? "Error",
      data: List<String>.from(json['data'].map((e) => e)),
    );
  }

  @override
  List<Object?> get props => [message, data];
}


// 402
// {
// "data": [],
// "message": "رقم الهاتف او كلمة المرور خاطئ"
// }
