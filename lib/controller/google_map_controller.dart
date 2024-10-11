import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapAddressController extends GetxController{

  RxBool isServiceEnabled = false.obs;
  late PermissionStatus permissionStatus;
  Location locationController = new Location();
  LatLng? currentP = null;

  Future<void> getLocationUpdate() async{
    isServiceEnabled.value = await locationController.serviceEnabled();
    if(isServiceEnabled.value){
      isServiceEnabled.value = await locationController.requestService();
    }else
      return;

    permissionStatus = await locationController.hasPermission();
    if(permissionStatus == PermissionStatus.denied){
      permissionStatus = await locationController.requestPermission();

      if(permissionStatus != PermissionStatus.granted){
        return;
      }
      locationController.onLocationChanged.listen((LocationData currentLocation) {
        if(currentLocation.latitude != null && currentLocation.longitude != null){
          currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print(currentP);
        }
      });
    }
  }
}