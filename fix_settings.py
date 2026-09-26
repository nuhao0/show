import os
import re

filepath = r"C:\Users\nuhan\Desktop\showpos\lib\settings_screen.dart"

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Fix "Reset Menu" functionality
content = re.sub(r"final batch = \s*for \(var item in INITIAL_MENU\) \{[\s\S]*?if \(context\.mounted\) \{", "if (context.mounted) {", content)
content = re.sub(r"await \s*", "", content)

# Fix "Clear All Data" functionality
content = re.sub(r"final batch = \s*final menuSnap = \s*for \(var doc in menuSnap\.docs\) \{[\s\S]*?final ordersSnap = \s*for \(var doc in ordersSnap\.docs\) \{[\s\S]*?if \(context\.mounted\) \{", "if (context.mounted) {", content)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)

print("Fixed settings_screen.dart")
