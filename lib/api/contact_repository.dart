import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:it_info_partners/utils/custom_widgets/dialog_box.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactRepository {
  Future sendEmail(BuildContext context, bool isLoading, String name, String phone, String email, String service, String message) async {
    try {
      const serviceId = 'service_e9u5ryk';
      const templateId = 'template_vdweu32';
      const publicKey = '_MjU5awmYin7JJCfh';

      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

      final body = jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {'user_name': name, 'user_phone': phone, 'user_email': email, 'user_service': service, 'user_message': message},
      });

      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          //'origin': 'https://www.itinfopartners.com',
          'Content-Type': 'application/json',
        },
        body: body,
      );
      debugPrint("Status Code---${response.statusCode}");
      debugPrint("response Body---${response.body}");
      debugPrint("response---$response");
      if (response.statusCode == 200) {
        debugPrint('✅ Email sent successfully!');
        if (!context.mounted) return;
        showAnimatedDialog(context, "Enquiry Submitted Successfully!", true);
        return response;
      } else {
        if (!context.mounted) return;
        showAnimatedDialog(context, "Enquiry Submitted Un-Successfully!", false);
      }
    } catch (e, stackTrace) {
      debugPrint("Error in Sending Email: ${e.toString()}");
      debugPrint("stackTrace in Sending Email: $stackTrace");
      showAnimatedDialog(context, "Something went wrong!\nTry Again Later.", false);
    } finally {
      isLoading;
    }
  }

  Future launchEmail1() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@itinfopartners.com',
      query: _encodeQueryParameters(<String, String>{
        'subject': 'Enquiry – IT Info Partners Website',
        'body':
            'Hello IT Info Partners Team,\n\n'
            'I would like to know more about your services.\n\n'
            'Please reach out to me with more details.\n\n'
            'Best regards,\n'
            '[Your Name]\n[Your Contact Number]',
      }),
    );

    try {
      if (!await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch email client');
      }
      //await launchUrl(emailLaunchUri);
    } catch (e) {
      debugPrint('Could not launch email: $e');
    }
  }

  Future launchEmail() async {
    try {
      final subject = Uri.encodeComponent('Enquiry – IT Info Partners');
      final body = Uri.encodeComponent('Hello IT Info Partners Team,\n\nI would like to know more about your services.\n\nBest regards,\n[Your Name]\n[Your Contact]');
      final gmailUrl = 'https://mail.google.com/mail/?view=cm&fs=1&to=info@itinfopartners.com&su=$subject&body=$body';

      if (!await launchUrl(Uri.parse(gmailUrl), mode: LaunchMode.externalApplication)) {
        debugPrint('Could not open Gmail');
      }
    } catch (e) {
      debugPrint('Could not launch email: $e');
    }
  }

  // Helper function to encode query parameters
  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }
}
