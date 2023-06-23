import 'package:catchrop_v1/product/init/theme/color/colors.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            ProductColorsTheme().firstColor, // Snackbar arka plan rengi
        elevation: 6.0, // Snackbar'ın yükseltilmesi (gölge)
        behavior: SnackBarBehavior.floating, // Snackbar'ın görünüm davranışı
        shape: RoundedRectangleBorder(
          // Snackbar şekli
          borderRadius: BorderRadius.circular(8.0),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white, // Snackbar metin rengi
            fontSize: 14,
          ),
        ),
        duration: Duration(seconds: 3), // Snackbar görüntülenme süresi
        action: SnackBarAction(
          // Snackbar içindeki eylem düğmesi
          label: 'Kapat',
          textColor: Colors.white, // Eylem düğmesi metin rengi
          onPressed: () {
            // Eylem düğmesine basıldığında yapılacak işlem
          },
        ),
      ),
    );
  }
}
