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
        content = content.replace("Atlantic Studio", "Atlantic Restaurant")
        content = content.replace("ATLANTIC STUDIO", "ATLANTIC RESTAURANT")
        
        # Replace email in auth_screens (could be demo@example.com or demo@fancy.com)
        content = content.replace("demo@example.com", "atlantic@gmail.com")
        content = content.replace("demo@fancy.com", "atlantic@gmail.com")
        
        # Small logo text is 'AS' right now (Atlantic Studio) -> let's make it 'AR' for Atlantic Restaurant
        content = content.replace('"AS"', '"AR"')
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)

print("Renamed Atlantic Studio to Atlantic Restaurant and updated email")
