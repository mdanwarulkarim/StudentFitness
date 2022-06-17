import 'package:flutter/material.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';
import 'package:student_fitness/widget/bg_widget.dart';

class InfoPage extends StatefulWidget {
  final bool isContactUs;
  const InfoPage({Key? key, required this.isContactUs}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final String _contactUs = 'It should be mentioned that sending us comments or bug reports is entirely up to your own free '
      'will and discretion.\n\nStudentfitness@gmail.com is the email address to contact if you have questions about our '
      'privacy policies or concerns about how your personal information is being handled. We will do our best to respond '
      'to your inquiries in a timely way';
  final String _privacyPolicy = "This Privacy Policy outlines Our policies and processes for collecting, using, and disclosing "
      "Your information when You use the Service and informs You about Your privacy rights and the legal protections available "
      "to You. We utilise Your Personally Identifiable Information to operate and improve the Service. By accessing and using "
      "the Service, you consent to the collection and use of information in the manner described in this Privacy Policy."
      "\n\nThe term 'Service Provider' refers to any individual or entity, natural or legal, who performs data processing "
      "on behalf of the business. Service providers are external firms or persons who work on behalf of a company, either "
      "in support of or in order to better understand how their product or service is being utilised.\n\nUsing a third-party "
      "social media service means logging into or creating an account on a website or social network that allows you to "
      "utilise the service.\nData that identifies or can be linked to an individual is referred to as Personal Data."
      "\nA person's name, identification number, location data, or online identifier are all examples of Personal Data for "
      "the purposes of the EU's General Data Protection Regulation (GDPR), which governs the collection, use, and disclosure "
      "of personal data.\nGeneral Information. When you sign up to use the App, we may collect Personal data about you such as:"
      "\n\nEmail address\nFirst name and last name\nPhone number\nGender\nPassword or passcode\nUsage Data\nHealth data. "
      "When you use the App, you may choose to provide personal information about your health such as:\nWeight\nHeight\nage"
      "\nComply to a legal obligation\nProtect and protect the Company's rights and property\nIdentify and prevent any "
      "misbehaviour in relation with the Service\nProtect the personal safety of Service Users and the general public"
      "\nProtect yourself from legal liabilities\nThe Protection of Your Personal Information\nWe secure your personal "
      "information by administrative, technological, and physical security methods. We secure your personal data using the "
      "following information security measures:Encrypt your personal data in transit and at rest; perform vulnerability "
      "scanning and penetration testing on your system; safeguard data integrity; and implement organisational and legal "
      "safeguards.Conduct periodic impact evaluations on data protection.We place a premium on the protection of Your Personal "
      "Data.\nAdvertising :\nWe may use Service providers to show advertisements to You to help support and maintain Our Service."
      "\nGoogle AdSense & DoubleClick Cookie :\nGoogle, as a third party vendor, uses cookies to serve ads on our Service. "
      "Google's use of the DoubleClick cookie enables it and its partners to serve ads to our users based on their visit to "
      "our Service or other websites on the Internet.\nWe will let You know via email or a prominent notice on Our Service, "
      "prior to the change becoming effective and update the 'Last updated' date at the top of this Privacy Policy. "
      "Google Analytics :\nGoogle Analytics is a web analytics service offered by Google that tracks and reports website "
      "traffic. Google uses the data collected to track and monitor the use of our Service. This data is shared with other "
      "Google services. Google may use the collected data to contextualise and personalise the ads of its own advertising "
      "network.\n\nWe will let You know via email or a prominent notice on Our Service, prior to the change becoming effective "
      "and update the 'Last updated' date at the top of this Privacy Policy.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: widget.isContactUs ? 'Contact Us' : 'Privacy Policy'),
      body: BgWidget(child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Text(widget.isContactUs ? _contactUs : _privacyPolicy, style: poppinsRegular.copyWith(fontSize: 12)),
      )),
    );
  }
}
