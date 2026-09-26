import urllib.request
import os

assets_dir = r"C:\Users\nuhan\Desktop\showpos\assets\mock"

urls_to_fix = {
    "img_2.jpg": "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=320&h=220&fit=crop",
    "img_5.jpg": "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=320&h=220&fit=crop",
    "img_7.jpg": "https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=320&h=220&fit=crop",
    "img_8.jpg": "https://images.unsplash.com/photo-1563805042-7684c8e9e533?w=320&h=220&fit=crop"
}

lib_data = r"C:\Users\nuhan\Desktop\showpos\lib\data.dart"
with open(lib_data, 'r', encoding='utf-8') as f:
    content = f.read()

for filename, url in urls_to_fix.items():
    filepath = os.path.join(assets_dir, filename)
    try:
        urllib.request.urlretrieve(url, filepath)
        print(f"Downloaded {filename}")
        
        # In data.dart, we need to find the remaining https://... and replace with assets/mock/img_...
        # Wait, since the original script didn't replace them (because it failed), the https url is still in data.dart
        # I'll just regex replace any remaining https://images.unsplash.com/... with the appropriate assets/mock/filename
    except Exception as e:
        print(f"Failed {filename}: {e}")

# Just fix the content to point to the correct files
import re
remaining_urls = re.findall(r'imageUrl: "(https://images\.unsplash\.com/[^"]+)"', content)
for i, url in enumerate(remaining_urls):
    if i == 0:
        content = content.replace(url, "assets/mock/img_2.jpg")
    elif i == 1:
        content = content.replace(url, "assets/mock/img_5.jpg")
    elif i == 2:
        content = content.replace(url, "assets/mock/img_7.jpg")
    elif i == 3:
        content = content.replace(url, "assets/mock/img_8.jpg")

with open(lib_data, 'w', encoding='utf-8') as f:
    f.write(content)

print("Fixed missing images")
