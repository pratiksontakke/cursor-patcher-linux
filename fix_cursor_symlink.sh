#!/bin/bash

# Create lowercase path and symlink to actual config
mkdir -p ~/.config/cursor/User/globalStorage
ln -sf ~/.config/Cursor/User/globalStorage/storage.json ~/.config/cursor/User/globalStorage/storage.json

echo "✅ Symlink created:"
ls -l ~/.config/cursor/User/globalStorage/storage.json
