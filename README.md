# ✅ Fix Guide: Cursor-Free-VIP Storage Path Issue

## 📌 Problem

The `cursor-free-vip` installer expects the config path to be:
```
~/.config/cursor/User/globalStorage/storage.json
```
But Cursor (the app) actually creates:
```
~/.config/Cursor/User/globalStorage/storage.json
```

Since Linux is **case-sensitive**, this causes the script to fail or show:
```
❌ Config File Not Found
```

---

## ✅ Solution

We will create a symbolic link so that the lowercase path points to the actual config file.

---

## 🛠️ Steps

### 1. Ensure Cursor has been opened at least once

This will generate the actual config file:
```bash
~/.config/Cursor/User/globalStorage/storage.json
```

Run:
```bash
ls -l ~/.config/Cursor/User/globalStorage/storage.json
```

If file not found, open Cursor once, then recheck.

---

### 2. Create the lowercase path and symlink

Run this in your terminal:

```bash
mkdir -p ~/.config/cursor/User/globalStorage
ln -s ~/.config/Cursor/User/globalStorage/storage.json ~/.config/cursor/User/globalStorage/storage.json
```

---

### 3. Re-run the activator script

```bash
./install.sh
```

You should now see:
```
✅ Storage file is valid and contains data
```

---

## ✅ Verify

Check if the symlink was created:

```bash
ls -l ~/.config/cursor/User/globalStorage/storage.json
```

Should show something like:
```bash
storage.json -> /home/pratik/.config/Cursor/User/globalStorage/storage.json
```

---

## 📦 Why This Works

- Script expects lowercase `.config/cursor/...`
- Actual config is in `.config/Cursor/...`
- Symlink bridges the two

This is a 100% working solution.
