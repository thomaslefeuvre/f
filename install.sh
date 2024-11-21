#!/bin/sh

if [ ! -x "$(which fzf 2>/dev/null)" ]; then
  echo "Please install: fzf (https://github.com/junegunn/fzf)" >&2
  exit 1
fi

BIN_DIR="${HOME}/.local/bin"
CONFIG_FILE="${HOME}/.fconfig"

if [ ! -d "$BIN_DIR" ]; then
  echo "Creating directory $BIN_DIR for user binaries."
  mkdir -p "$BIN_DIR"
else
  echo "Directory $BIN_DIR already exists."
fi

echo "Installing..."

TMP=$(mktemp -d)
trap 'rm -rf $TMP' EXIT

git -C "$TMP" clone http://github.com/thomaslefeuvre/f.git "${TMP}/repository"
cd "${TMP}/repository" || exit 1

cp bin/fa "$BIN_DIR"
cp bin/f "$BIN_DIR"

chmod +x "$BIN_DIR/fa" "$BIN_DIR/f"

echo "Setting up config file..."

touch "$CONFIG_FILE"

if ! grep -q "$BIN_DIR" ~/.bashrc; then
  echo "Adding ${BIN_DIR} to PATH in ~/.bashrc"
  echo "export PATH=\"${BIN_DIR}:\$PATH\"" >> ~/.bashrc
fi

echo "Installation complete!"
echo "You can now use the 'f' and 'fa' commands."
echo "Don't forget to source your .bashrc or restart the terminal to apply the changes."
