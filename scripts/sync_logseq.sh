#!/run/current-system/sw/bin/bash

# Überprüfen, ob der SSH-Agent bereits läuft
if pgrep -f "ssh-agent" > /dev/null
then
    echo "SSH-Agent läuft bereits."
else
    # Startet den SSH-Agenten, falls er noch nicht läuft
    eval "$(ssh-agent -s)"
    echo "SSH-Agent wurde gestartet."
fi

# Fügt den privaten Schlüssel hinzu
# Ersetze ~/.ssh/id_balbal durch den Pfad zu deinem Schlüssel
# Du wirst nach der Passphrase gefragt
ssh-add ~/.ssh/id_ed25519.txt

echo "Github test..."

ssh -T git@github.com

echo "Privater SSH-Schlüssel wurde dem Agenten hinzugefügt."

cd ~/Documents/logseq

git add .

git commit -m "update" || echo "Nothing to commit"

git push

echo "synchronised logseq graph with github repo."
