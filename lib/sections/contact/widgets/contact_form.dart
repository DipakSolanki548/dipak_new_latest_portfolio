import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/app_theme.dart';
import '../../../constants.dart';
import '../../../provider/app_provider.dart';
import '../../../text/textfile.dart';

class DirectContactForm extends StatefulWidget {
  const DirectContactForm({Key? key}) : super(key: key);

  @override
  State<DirectContactForm> createState() => _DirectContactFormState();
}

class _DirectContactFormState extends State<DirectContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;
  String? _statusMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  String _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _dispatchEmail() {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
      _statusMessage = null;
    });

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final subject = _subjectController.text.trim().isNotEmpty
        ? _subjectController.text.trim()
        : "Portfolio Project Inquiry";
    final message = _messageController.text.trim();

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: valueEmail,
      query: _encodeQueryParameters(<String, String>{
        'subject': '[$subject] from $name',
        'body':
            'Hello Dipak,\n\nName: $name\nEmail: $email\nSubject: $subject\n\nMessage:\n$message\n\n---\nSent from Dipak Solanki Portfolio Contact Form',
      }),
    );

    openURL(emailLaunchUri.toString());

    setState(() {
      _isSubmitting = false;
      _statusMessage =
          "Email client opened! You can dispatch your message directly to $valueEmail.";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Ready to dispatch! Your email app has been opened to send to $valueEmail",
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppTheme.c!.primary,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff18181f) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.35)
                : Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.send_rounded,
                    color: AppTheme.c!.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Direct Message Dispatch",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: isDark ? Colors.white : const Color(0xff0f172a),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Send a message directly to Dipak Solanki ($valueEmail)",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isDark ? Colors.white60 : const Color(0xff64748b),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Name & Email Fields
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 500) {
                  return Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: _nameController,
                          label: "Your Name",
                          hint: "John Doe",
                          icon: Icons.person_rounded,
                          isDark: isDark,
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextField(
                          controller: _emailController,
                          label: "Your Email",
                          hint: "john@example.com",
                          icon: Icons.alternate_email_rounded,
                          keyboardType: TextInputType.emailAddress,
                          isDark: isDark,
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) {
                              return "Please enter your email";
                            }
                            if (!val.contains('@') || !val.contains('.')) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildTextField(
                        controller: _nameController,
                        label: "Your Name",
                        hint: "John Doe",
                        icon: Icons.person_rounded,
                        isDark: isDark,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      _buildTextField(
                        controller: _emailController,
                        label: "Your Email",
                        hint: "john@example.com",
                        icon: Icons.alternate_email_rounded,
                        keyboardType: TextInputType.emailAddress,
                        isDark: isDark,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Please enter your email";
                          }
                          if (!val.contains('@') || !val.contains('.')) {
                            return "Enter a valid email address";
                          }
                          return null;
                        },
                      ),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 14),

            // Subject / Project Scope Field
            _buildTextField(
              controller: _subjectController,
              label: "Subject / Project Scope",
              hint: "e.g., Enterprise Flutter App Development / Consultation",
              icon: Icons.topic_rounded,
              isDark: isDark,
            ),
            const SizedBox(height: 14),

            // Message Field
            _buildTextField(
              controller: _messageController,
              label: "Project Details / Message",
              hint:
                  "Describe your timeline, platform requirements (Android/iOS/Flutter), or questions...",
              icon: Icons.chat_bubble_outline_rounded,
              maxLines: 4,
              isDark: isDark,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your message";
                }
                if (val.trim().length < 10) {
                  return "Please provide a bit more detail (at least 10 characters)";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            if (_statusMessage != null) ...[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppTheme.c!.primary!.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 16,
                      color: AppTheme.c!.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _statusMessage!,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: _isSubmitting ? null : _dispatchEmail,
                icon: const Icon(
                  Icons.send_rounded,
                  size: 16,
                  color: Colors.white,
                ),
                label: Text(
                  _isSubmitting ? "Opening Email..." : "Send Message to Dipak",
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.c!.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool isDark,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white70 : const Color(0xff475569),
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 13.5,
            color: isDark ? Colors.white : const Color(0xff0f172a),
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.5,
              color: isDark ? Colors.white38 : const Color(0xff94a3b8),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                bottom: maxLines > 1 ? 50 : 0,
              ),
              child: Icon(
                icon,
                size: 18,
                color: isDark ? Colors.white54 : Colors.black45,
              ),
            ),
            filled: true,
            fillColor:
                isDark ? const Color(0xff121217) : const Color(0xfff8fafc),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.08),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppTheme.c!.primary!,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
