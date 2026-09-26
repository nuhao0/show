import urllib.request
import os
import re

lib_data = r"C:\Users\nuhan\Desktop\showpos\lib\data.dart"
assets_dir = r"C:\Users\nuhan\Desktop\showpos\assets\mock"

with open(lib_data, 'r', encoding='utf-8') as f:
    content = f.read()

# find all imageUrls
urls = re.findall(r'imageUrl: "(https://images\.unsplash\.com/[^"]+)"', content)
print(f"Found {len(urls)} URLs")

for i, url in enumerate(urls):
    filename = f"img_{i}.jpg"
    filepath = os.path.join(assets_dir, filename)
    try:
        urllib.request.urlretrieve(url, filepath)
        print(f"Downloaded {filename}")
        # Replace in content
        content = content.replace(url, f"assets/mock/{filename}")
    except Exception as e:
        print(f"Failed {filename}: {e}")

with open(lib_data, 'w', encoding='utf-8') as f:
    f.write(content)

print("Updated data.dart")
