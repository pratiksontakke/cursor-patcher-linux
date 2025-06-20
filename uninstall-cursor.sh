#!/bin/bash

uninstallCursor() {
    INSTALL_DIR="/opt/CursorInstall"
    APPIMAGE_NAME="Cursor-1.1.3-x86_64.AppImage"
    APPIMAGE_PATH="$INSTALL_DIR/$APPIMAGE_NAME"
    ICON_PATH="$INSTALL_DIR/cursor.png"
    DESKTOP_ENTRY_PATH="/usr/share/applications/cursor.desktop"

    echo "Uninstalling Cursor AI IDE..."

    # Remove AppImage
    if [ -f "$APPIMAGE_PATH" ]; then
        sudo rm -f "$APPIMAGE_PATH"
        echo "✅ Removed AppImage from $APPIMAGE_PATH"
    else
        echo "ℹ️ AppImage not found at $APPIMAGE_PATH"
    fi

    # Remove icon
    if [ -f "$ICON_PATH" ]; then
        sudo rm -f "$ICON_PATH"
        echo "✅ Removed icon from $ICON_PATH"
    else
        echo "ℹ️ Icon not found at $ICON_PATH"
    fi

    # Remove installation directory if empty
    if [ -d "$INSTALL_DIR" ]; then
        sudo rmdir "$INSTALL_DIR" 2>/dev/null && echo "✅ Removed empty directory $INSTALL_DIR"
    fi

    # Remove .desktop entry
    if [ -f "$DESKTOP_ENTRY_PATH" ]; then
        sudo rm -f "$DESKTOP_ENTRY_PATH"
        echo "✅ Removed desktop entry from $DESKTOP_ENTRY_PATH"
    else
        echo "ℹ️ Desktop entry not found at $DESKTOP_ENTRY_PATH"
    fi

    # Remove known config/cache/state folders
    echo "🧹 Removing user cache and config folders..."
    rm -rf ~/.config/CursorAI
    rm -rf ~/.cache/CursorAI
    rm -rf ~/.local/share/CursorAI
    rm -rf ~/.local/share/applications/cursor.desktop
    rm -rf ~/.config/cursor
    rm -rf ~/.cache/cursor
    rm -rf ~/.local/state/cursor
    rm -rf ~/.config/Cursor
    rm -rf ~/.cursor

    echo "✅ Cursor AI IDE has been fully uninstalled."
}

uninstallCursor

