import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopping_app/controller/google_map_controller.dart';
import 'package:shopping_app/styles/font.dart';

class GoogleMapAddressScreen extends StatefulWidget {
  const GoogleMapAddressScreen({super.key});

  @override
  State<GoogleMapAddressScreen> createState() => _GoogleMapViewState();
}


class _GoogleMapViewState extends State<GoogleMapAddressScreen> {
  static const LatLng _KMA = LatLng(20.9807, 105.7964);

  final GoogleMapAddressController controller = Get.find<GoogleMapAddressController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getLocationUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Địa chỉ cửa hàng", style: kStyleTitle(fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.white,
          ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: GoogleMap(
            initialCameraPosition: CameraPosition(target: _KMA, zoom: 13),
            markers: {
              Marker(
                  markerId: MarkerId("_KMALocation"),
                  position: _KMA,
                  icon: BitmapDescriptor.defaultMarker)
            }),
      ),
    );

  }
}
