#!/usr/bin/env bash
# Stamp content.json with a fresh version (yyyymmddhhmmss), commit, and push.
# Displays pick up the change within ~5 minutes.
set -euo pipefail
cd "$(dirname "$0")"

V=$(date +%Y%m%d%H%M%S)

# Replace the "version" value (number or string) in place — preserves formatting
sed -i '' -E "s/(\"version\"[[:space:]]*:[[:space:]]*)[^,]*/\1\"$V\"/" content.json

# Validate before committing
python3 -c "import json; json.load(open('content.json'))"

git add content.json
git commit -m "content $V"
git push
echo "Published content $V"
