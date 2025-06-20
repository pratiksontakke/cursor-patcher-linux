#!/bin/bash

uninstallCursor() {
    echo "Uninstalling Cursor AI IDE..."

    # Paths used during installation
    APPIMAGE_PATH="/opt/cursor.appimage"
    ICON_PATH="/opt/cursor.png"
    DESKTOP_ENTRY_PATH="/usr/share/applications/cursor.desktop"

    # Remove AppImage
    if [ -f "$APPIMAGE_PATH" ]; then
        sudo rm -f "$APPIMAGE_PATH"
        echo "Removed AppImage from $APPIMAGE_PATH"
    fi

    # Remove icon
    if [ -f "$ICON_PATH" ]; then
        sudo rm -f "$ICON_PATH"
        echo "Removed icon from $ICON_PATH"
    fi

    # Remove .desktop entry
    if [ -f "$DESKTOP_ENTRY_PATH" ]; then
        sudo rm -f "$DESKTOP_ENTRY_PATH"
        echo "Removed desktop entry from $DESKTOP_ENTRY_PATH"
    fi

    # Remove user-specific cache and config directories (these vary, so check multiple possibilities)
    echo "Removing user cache and config folders..."
    rm -rf ~/.config/CursorAI
    rm -rf ~/.cache/CursorAI
    rm -rf ~/.local/share/CursorAI
    rm -rf ~/.local/share/applications/cursor.desktop
    rm -rf ~/.config/cursor
    rm -rf ~/.cache/cursor
    rm -rf ~/.local/state/cursor
    rm -rf ~/.config/Cursor
    rm -rf ~/.cursor

    echo "Cursor AI IDE has been fully uninstalled."
}

uninstallCursor

