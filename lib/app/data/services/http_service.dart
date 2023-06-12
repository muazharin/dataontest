import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class HttpServices {
  Future get(path) async {
    Uri url = Uri.parse("$path");
    try {
      return await http.get(url).timeout(const Duration(seconds: 30));
    } on TimeoutException catch (_) {
      throw 'Request Timeout';
    } on SocketException catch (_) {
      throw 'Unable to access server';
    } catch (e) {
      throw 'Error: $e';
    }
  }
}
