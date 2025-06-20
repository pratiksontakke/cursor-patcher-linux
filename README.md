# Cursor Setup Guide

## Installation Steps

### 1. Make scripts executable
```bash
chmod +x install_cursor.sh
chmod +x uninstall-cursor.sh
```

### 2. Install Cursor
```bash
./install_cursor.sh
```

### 3. Uninstall Cursor (if needed)
```bash
./uninstall-cursor.sh
```

### 3. Go Cursor Help
Visit: https://github.com/yuaotian/go-cursor-help

### 4. Cursor Free VIP
Visit: https://github.com/yeongpin/cursor-free-vip

## Fix Storage Path Error

If you encounter error while running cursor-free-vip:

### Step 1: Check if config file exists
```bash
ls -l ~/.config/Cursor/User/globalStorage/storage.json
```

Expected Output:
```bash
-rw-rw-r-- 1 pratik pratik 2024 Jun 20 14:12 /home/pratik/.config/Cursor/User/globalStorage/storage.json
```

### Step 2: Create symlink for lowercase path
```bash
mkdir -p ~/.config/cursor/User/globalStorage
ln -s ~/.config/Cursor/User/globalStorage/storage.json ~/.config/cursor/User/globalStorage/storage.json
```

Now re-run the cursor-free-vip script and it should work.