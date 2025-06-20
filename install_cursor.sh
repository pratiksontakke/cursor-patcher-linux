#!/bin/bash

installCursor() {
    INSTALL_DIR="/opt/CursorInstall"
    APPIMAGE_NAME="Cursor-1.1.3-x86_64.AppImage"
    APPIMAGE_PATH="$INSTALL_DIR/$APPIMAGE_NAME"
    ICON_PATH="$INSTALL_DIR/cursor.png"
    DESKTOP_ENTRY_PATH="/usr/share/applications/cursor.desktop"

    # Only install if the AppImage isn't already present
    if ! [ -f "$APPIMAGE_PATH" ]; then
        echo "Installing Cursor AI IDE..."

        # URLs
        CURSOR_URL="https://downloads.cursor.com/production/979ba33804ac150108481c14e0b5cb970bda3266/linux/x64/$APPIMAGE_NAME"
        ICON_URL="https://custom.typingmind.com/assets/models/cursor.png"

        # Ensure installation directory exists
        sudo mkdir -p "$INSTALL_DIR"

        # Install curl if not available
        if ! command -v curl &> /dev/null; then
            echo "curl is not installed. Installing..."
            sudo apt-get update
            sudo apt-get install -y curl
        fi

        # Download Cursor AppImage
        echo "Downloading Cursor AppImage..."
        sudo curl -L "$CURSOR_URL" -o "$APPIMAGE_PATH"
        sudo chmod +x "$APPIMAGE_PATH"

        # Download Cursor icon
        echo "Downloading Cursor icon..."
        sudo curl -L "$ICON_URL" -o "$ICON_PATH"

        # Create .desktop entry
        echo "Creating .desktop entry for Cursor..."
        sudo bash -c "cat > $DESKTOP_ENTRY_PATH" <<EOL
[Desktop Entry]
Name=Cursor
Exec=$APPIMAGE_PATH --no-sandbox
Icon=$ICON_PATH
Type=Application
Categories=Development;
EOL

        echo "✅ Cursor AI IDE installation complete. You can find it in your application menu."
    else
        echo "⚠️ Cursor AI IDE is already installed at $APPIMAGE_PATH."
    fi
}

installCursor

