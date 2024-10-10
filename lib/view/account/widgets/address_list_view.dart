// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shopping_app/controller/address_controller.dart';
// import 'package:shopping_app/styles/font.dart';
// import 'package:shopping_app/view/account/widgets/line_text_field.dart';
//
// class AddressListView extends StatelessWidget {
//   const AddressListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final AddressController controller = Get.find<AddressController>();
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: Icon(Icons.arrow_back_ios_new)),
//         centerTitle: true,
//         title: Text(
//           controller.isEdit.value ? "Sửa địa chỉ" : "Thêm địa chỉ",
//           style: kStyleTitle(fontSize: 20)
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   Obx(
//                         () => Row(
//                       children: [
//                         Expanded(
//                           child: InkWell(
//                             onTap: () {
//                               addressVM.txtType.value = "Home";
//                             },
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   addressVM.txtType.value == "Home"
//                                       ? Icons.radio_button_checked
//                                       : Icons.radio_button_off,
//                                   color: TColor.primaryText,
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   "Home",
//                                   style: kStyleTitle(fontSize: 16)
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                             child: InkWell(
//                               onTap: () {
//                                 addressVM.txtType.value = "Office";
//                               },
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     addressVM.txtType.value == "Office"
//                                         ? Icons.radio_button_checked
//                                         : Icons.radio_button_off,
//                                     color: Colors.black
//                                   ),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   Text(
//                                     "Office",
//                                     style: kStyleTitle(fontSize: 16)
//                                 ],
//                               ),
//                             ))
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   LineTextField(
//                       title: "Name",
//                       placeholder: "Enter you name",
//                       controller: addressVM.txtName.value),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   LineTextField(
//                       title: "Mobile",
//                       placeholder: "Enter you mobile number",
//                       keyboardType: TextInputType.phone,
//                       controller: addressVM.txtMobile.value),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   LineTextField(
//                       title: "Address Line",
//                       placeholder: "Enter you address",
//                       controller: addressVM.txtAddressLine.value),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: LineTextField(
//                             title: "City",
//                             placeholder: "Enter City",
//                             controller: addressVM.txtCity.value),
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: LineTextField(
//                             title: "State",
//                             placeholder: "Enter State",
//                             controller: addressVM.txtState.value),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   LineTextField(
//                       title: "Postal Code",
//                       placeholder: "Enter you Postal Code",
//                       controller: addressVM.txtPostalCode.value),
//
//                 ],
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               Container(
//                 height: 67,
//                 child: ElevatedButton(
//                   onPressed: accountController.logout,
//                   child: Text(
//                     'Đăng xuất',
//                     style: textButton,
//                   ),
//                   style: buttonPrimary,
//                 ),
//               )
//               RoundButton(title: widget.isEdit ? "Update" :  "Add Address", onPressed: () {
//
//                 if(widget.isEdit) {
//                   addressVM.serviceCallUpdate( widget.aObj?.addressId ?? 0 , () {
//                     Navigator.pop(context);
//                   });
//                 }else{
//                   addressVM.serviceCallAdd(() {
//                     Navigator.pop(context);
//                   });
//                 }
//
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
