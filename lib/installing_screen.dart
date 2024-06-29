import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class InstallingScreen extends StatelessWidget {
  const InstallingScreen({super.key});

  final String data = '''
  # How to install Me

I'd love to hear from you! Here's how you can install me:
  
--- 
  
  
  
  
## 📞 Phone
+82 10-2357-7966

## ✉️ Email
qpfjf56@gmail.com
  ''';

  @override
  Widget build(BuildContext context) {
    return Markdown(data: data);
  }
}
