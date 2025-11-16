import 'package:url_launcher/url_launcher.dart';

bool isLoggedUser = false;

class Constants {
  static const String USER_KEY = 'USERKEY';

  static Future<void> openTelegramBot() async {
    final Uri telegramUrl = Uri.parse('tg://resolve?domain=aqar3_bot');
    if (!await launchUrl(telegramUrl, mode: LaunchMode.externalApplication)) {
      final Uri webUrl = Uri.parse('https://t.me/aqar3_bot?start=welcome');
      await launchUrl(webUrl, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> makePhoneCall() async {
    final Uri url = Uri(scheme: 'tel', path: '+20 1095856941');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> sendEmail() async {
    final Uri gmailUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm&fs=1'
      '&to=karimslama917@gmail.com'
      '&su=Hello%20Karim'
      '&body=I%20want%20to%20contact%20you',
    );

    if (await canLaunchUrl(gmailUri)) {
      await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open Gmail';
    }
  }

  static Future<void> launchMyUrl(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  static String handleError(dynamic error) {
    if (error.toString().contains('already registered')) {
      return 'This email is already registered';
    } else if (error.toString().contains('Invalid login')) {
      return 'Invalid email or password';
    } else if (error.toString().contains('Network')) {
      return 'Network error. Please check your connection';
    }
    return error.toString();
  }
}
