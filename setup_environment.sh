#!/bin/bash

echo "🚀 Starting DevOps Environment Setup..."

BASE_DIR=devops_challenge
LOGS_DIR="$BASE_DIR/logs"
CONFIGS_DIR="$BASE_DIR/configs"
SCRIPTS_DIR="$BASE_DIR/scripts"

# ---------------- CREATE DIRECTORIES ----------------
for dir in "$LOGS_DIR" "$CONFIGS_DIR" "$SCRIPTS_DIR"
do
  if [ -d "$dir" ]; then
    echo " Directory already exists: $dir"
  else
    mkdir -p "$dir"
    echo " Created directory: $dir"
  fi
done

# ---------------- CREATE FILES ----------------
LOG_FILE="$LOGS_DIR/system.log"
CONF_FILE="$CONFIGS_DIR/app.conf"
SCRIPT_FILE="$SCRIPTS_DIR/backup.sh"

# system.log
if [ ! -f "$LOG_FILE" ]; then
  echo "System started successfully." > "$LOG_FILE"
  echo " Created: logs/system.log"
else
  echo " File already exists: $LOG_FILE"
fi

# app.conf
if [ ! -f "$CONF_FILE" ]; then
  echo "APP_ENV=production" > "$CONF_FILE"
  echo " Created: configs/app.conf"
else
  echo " File already exists: $CONF_FILE"
fi

# backup.sh
if [ ! -f "$SCRIPT_FILE" ]; then
  cat <<EOF > "$SCRIPT_FILE"
#!/bin/bash
echo "Backing up files..."
EOF
  echo " Created: scripts/backup.sh"
else
  echo " File already exists: $SCRIPT_FILE"
fi

# ---------------- SET PERMISSIONS ----------------

chmod 644 "$LOG_FILE"      # -rw-r--r--
chmod 444 "$CONF_FILE"     # -r--r--r--
chmod 755 "$SCRIPT_FILE"   # -rwxr-xr--

echo "✅ Permissions set successfully"

# ---------------- DISPLAY STRUCTURE ----------------

echo -e "\n📂 Directory Structure:"
if command -v tree > /dev/null; then
    tree "$BASE_DIR"
else
    echo "\n Tree is not installed. Using ls instead."
    ls -R "$BASE_DIR"
fi

echo -e "\n Permissions Overview:"
ls -lR "$BASE_DIR"

echo -e "\n🎉 Setup complete!"
