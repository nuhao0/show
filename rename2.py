import os
import re

lib_dir = r"C:\Users\nuhan\Desktop\showpos\lib"
files_to_update = ['main.dart', 'modals.dart', 'settings_screen.dart', 'widgets.dart', 'auth_screens.dart', 'data.dart']

for file_name in files_to_update:
    filepath = os.path.join(lib_dir, file_name)
    if os.path.exists(filepath):
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Replace Restaurant Name
        content = content.replace("Fancy Restaurant POS", "Atlantic Studio POS")
        content = content.replace("Fancy Restaurant", "Atlantic Studio")
        content = content.replace("FANCY RESTAURANT", "ATLANTIC STUDIO")
        # Update the small logo text
        content = content.replace('"FR"', '"AS"')
        
        # Replace Cashier Name from Ahmed to Atlantic
        content = content.replace("'name': 'Ahmed'", "'name': 'Atlantic'")
        content = content.replace("?? 'Ahmed'", "?? 'Atlantic'")
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)

print("Renamed Fancy Restaurant to Atlantic Studio and Ahmed to Atlantic")
