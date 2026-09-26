import os
import re

lib_dir = r"C:\Users\nuhan\Desktop\showpos\lib"

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Common replacements
    content = re.sub(r"import 'package:cloud_firestore/cloud_firestore\.dart'[^;]*;", "", content)
    content = re.sub(r"import 'package:firebase_core/firebase_core\.dart'[^;]*;", "", content)
    content = re.sub(r"import 'package:firebase_auth/firebase_auth\.dart'[^;]*;", "", content)
    content = re.sub(r"import 'firebase_options\.dart'[^;]*;", "", content)

    if "main.dart" in filepath:
        # Remove Firebase initialization
        content = re.sub(r"await Firebase\.initializeApp\([^)]+\);", "", content)
        # Main layout state replacements
        content = re.sub(r"void _listenToFirebase\(\) \{[\s\S]*?\}\s*@override\s*void dispose\(\) \{", "@override\n  void dispose() {", content)
        # Remove Firebase calls in settings / menu / checkout
        content = re.sub(r"FirebaseFirestore\.instance[^;]+;", "", content)
        content = re.sub(r"FirebaseAuth\.instance[^;]+;", "", content)
        # Remove _listenToFirebase() calls inside main.dart
        content = re.sub(r"_listenToFirebase\(\);", "", content)

    if "models.dart" in filepath:
        content = content.replace("import 'package:cloud_firestore/cloud_firestore.dart';", "")
        content = re.sub(r"if \(json\['date'\] is Timestamp\) \{[\s\S]*?\} else \{[\s\S]*?\}", "parsedDate = DateTime.parse(json['date'].toString());", content)
        content = content.replace("'date': Timestamp.fromDate(date),", "'date': date.toIso8601String(),")

    if "settings_screen.dart" in filepath:
        content = re.sub(r"FirebaseFirestore\.instance[^;]+;", "", content)
        content = re.sub(r"final batch = FirebaseFirestore\.instance\.batch\(\);", "", content)
        content = re.sub(r"batch\.set\([^)]+\);", "", content)
        content = re.sub(r"batch\.commit\(\);", "", content)
        content = re.sub(r"final menuSnap = await.*?get\(\);", "final menuSnap = [];", content)
        content = re.sub(r"final ordersSnap = await.*?get\(\);", "final ordersSnap = [];", content)

    if "auth_screens.dart" in filepath:
        # We will just replace auth_screens.dart entirely to mock it
        pass

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

for filename in os.listdir(lib_dir):
    if filename.endswith(".dart"):
        filepath = os.path.join(lib_dir, filename)
        process_file(filepath)

print("Processing complete.")
