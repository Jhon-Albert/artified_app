import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms and Conditions"),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // This will navigate back to the previous screen
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terms and Conditions (\"Terms\")",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Our Terms and Conditions were last updated on November 5, 2024.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Please read these terms and conditions carefully before using Our Service.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Interpretation and Definitions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Interpretation\nThe words with initial letters capitalized have meanings defined under the following conditions. The definitions provided shall hold the same meaning regardless of whether they appear in singular or plural.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Definitions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "For the purposes of these Terms and Conditions:\n\n• Affiliate: Refers to an entity that controls, is controlled by, or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest, or other securities entitled to vote for election of directors or other managing authority.\n• Account: A unique account created for You to access our Service or parts of our Service.\n• Company: Refers to ARTIFIED, \"the Company\", \"We\", \"Us\", or \"Our\".\n• Country: Refers to the Philippines.\n• Device: Any device that can access the Service, such as a cellphone, or digital tablet.\n• Products: The items offered for sale on the Service.\n• Orders: A request by You to purchase Products from Us.\n• Service: Refers to the food ordering application.\n• Terms and Conditions: These Terms and Conditions form the entire agreement between You and the Company regarding the use of the Service.\n• You: The individual accessing or using the Service, or the company or other legal entity on behalf of which such individual is accessing or using the Service.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Acknowledgment",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "These Terms and Conditions govern the use of this Service and form the agreement that operates between You and the Company. Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions.\nBy accessing or using the Service, You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions, please do not access the Service.\nYou represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "User Accounts",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "When creating an account with Us, You must provide accurate, complete, and current information at all times. Failure to do so constitutes a breach of the Terms and may result in the termination of Your account on Our Service.\nYou are responsible for safeguarding the password You use to access the Service and for any activities or actions under Your password. You agree not to disclose Your password to any third party and must notify Us immediately upon becoming aware of any security breach or unauthorized use of Your account.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Personal Information Collection",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "By using the Service, You agree that We may collect certain personal information, including Your Name, Email, Password, and Username. Please refer to Our Privacy Policy for details on how we handle Your information.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Orders and Purchases",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "You can place Orders for food products through the Service. By placing an Order, You warrant that You are legally capable of entering into binding contracts.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Your Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "When placing an Order, You may be required to provide certain details, such as Your name, email, phone number, billing address, and payment information. By providing such information, You grant Us the right to use it to complete Your Order.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Order Cancellation",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "We reserve the right to refuse or cancel Orders at any time, including but not limited to, for reasons such as Product availability or errors in the description or pricing of Products. We may also cancel an Order if we suspect fraud or unauthorized activity.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Intellectual Property",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "The Service and its original content, features, and functionality are and will remain the exclusive property of the Company and its licensors. The Service is protected by copyright, trademark, and other laws of both the Country and foreign countries.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Termination",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "We may terminate or suspend Your account without prior notice or liability, for any reason, including if You breach these Terms and Conditions. Upon termination, Your right to use the Service will cease immediately.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Limitation of Liability",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "The Company shall not be liable for any special, incidental, indirect, or consequential damages (including but not limited to loss of profits or data) arising out of or in any way related to Your use of the Service.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Changes to These Terms and Conditions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "We reserve the right to modify or replace these Terms at any time. If a revision is material, We will make reasonable efforts to provide at least 30 days' notice before any new terms take effect. Continuing to access or use Our Service after revisions become effective means You agree to be bound by the revised Terms.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "If you have any questions about these Terms and Conditions, you can contact us:\n• By email at franchisingofficer@lekatsumanila.com.ph\n• By visiting this page on our website: https://lekatsumanila.com.ph",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
