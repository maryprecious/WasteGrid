import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanController extends GetxController {
  var scanState = 0.obs;
  var barcode = ''.obs;
  var recyclable = false.obs;
  var productType = ''.obs;
  var manufacturer = ''.obs;
  var countryOfOrigin = ''.obs;
  var productionDate = ''.obs;
  var expirationDate = ''.obs;

  MobileScannerController mobileScannerController = MobileScannerController();

  void startScan() {
    scanState.value = 1;
    mobileScannerController.start();
  }

  void resetScan() {
    scanState.value = 0;
    barcode.value = '';
    recyclable.value = false;
    productType.value = '';
    manufacturer.value = '';
    countryOfOrigin.value = '';
    productionDate.value = '';
    expirationDate.value = '';
  }

  void onBarcodeDetected(BarcodeCapture capture) {
    if (capture.barcodes.isEmpty) return;

    final Barcode scannedBarcode = capture.barcodes.first;
    final String? code = scannedBarcode.rawValue;
    if (code == null) return;

    barcode.value = code;

    recyclable.value = code.startsWith('9'); // Dummy condition

    // Set other product details as needed
    productType.value = 'Example Product';
    manufacturer.value = 'Example Manufacturer';
    countryOfOrigin.value = 'Example Country';
    productionDate.value = '2023-01-01';
    expirationDate.value = '2025-01-01';

    scanState.value = 2; // Scan complete
    mobileScannerController.stop();
  }
}
