import 'dart:convert';

List<BranchDetailsModel> branchDetailsModelFromJson(String str) =>
    List<BranchDetailsModel>.from(
        json.decode(str).map((x) => BranchDetailsModel.fromJson(x)));

String branchDetailsModelToJson(List<BranchDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranchDetailsModel {
  final String branchId;
  final String branchName;
  final String branchPhone;
  final String branchAddress;
  final String locationUrl;
  final String branchUrl;

  BranchDetailsModel({
    required this.branchId,
    required this.branchName,
    required this.branchPhone,
    required this.branchAddress,
    required this.locationUrl,
    required this.branchUrl,
  });

  factory BranchDetailsModel.fromJson(dynamic json) => BranchDetailsModel(
        branchId: json["branch_id"].toString(),
        branchName: json["branch_name"].toString(),
        branchPhone: json["branch_phone"].toString(),
        branchAddress: json["branch_Address"].toString(),
        locationUrl: json["Location_Url"].toString(),
        branchUrl: json["branch_url"].toString(),
      );

  dynamic toJson() => {
        "branch_id": branchId,
        "branch_name": branchName,
        "branch_phone": branchPhone,
        "branch_Address": branchAddress,
        "Location_Url": locationUrl,
        "branch_url": branchUrl,
      };
}

// class BranchDetailsModel {
//   String? branchId;
//   String? branchName;
//   String? branchPhone;
//   String? branchAddress;
//   String? locationUrl;
//   String? branchUrl;

//   BranchDetailsModel(
//       {this.branchId,
//       this.branchName,
//       this.branchPhone,
//       this.branchAddress,
//       this.locationUrl,
//       this.branchUrl});

//   BranchDetailsModel.fromJson(Map<String, dynamic> json) {
//     branchId = json['branch_id'];
//     branchName = json['branch_name'];
//     branchPhone = json['branch_phone'];
//     branchAddress = json['branch_Address'];
//     locationUrl = json['Location_Url'];
//     branchUrl = json['branch_url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['branch_id'] = this.branchId;
//     data['branch_name'] = this.branchName;
//     data['branch_phone'] = this.branchPhone;
//     data['branch_Address'] = this.branchAddress;
//     data['Location_Url'] = this.locationUrl;
//     data['branch_url'] = this.branchUrl;
//     return data;
//   }
// }
