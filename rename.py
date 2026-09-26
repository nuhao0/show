import os
import re

lib_dir = r"C:\Users\nuhan\Desktop\showpos\lib"
files_to_update = ['main.dart', 'modals.dart', 'settings_screen.dart', 'widgets.dart', 'auth_screens.dart', 'pos_screen.dart', 'history_screen.dart', 'reports_screen.dart', 'menu_screen.dart']

for file_name in files_to_update:
    filepath = os.path.join(lib_dir, file_name)
    if os.path.exists(filepath):
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Replace MM House
        content = content.replace("MM House POS", "Fancy Restaurant POS")
        content = content.replace("MM House", "Fancy Restaurant")
        content = content.replace("MM HOUSE", "FANCY RESTAURANT")
        # Replace the small logo abbreviation MM
        content = content.replace('"MM"', '"FR"')
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)

print("Renamed MM House to Fancy Restaurant")
