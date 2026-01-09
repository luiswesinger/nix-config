#!/usr/bin/env bash

# This script synchronizes a Logseq graph with a Git repository.

set -euo pipefail

# --- CONFIGURATION ---
# The absolute path to your Logseq graph
LOGSEQ_DIR="${HOME}/Documents/logseq"

# --- FUNCTIONS ---
# Function to print an error message and exit
# Usage: error "Your error message"
error() {
  echo "❌ Error: $1" >&2
  exit 1
}

# Function to print a success message
# Usage: success "Your success message"
success() {
  echo "✅ Success: $1"
}

# --- MAIN SCRIPT ---
main() {
  # Check if the Logseq directory exists
  if [ ! -d "${LOGSEQ_DIR}" ]; then
    error "Logseq directory not found at ${LOGSEQ_DIR}"
  fi

  # Change to the Logseq directory
  cd "${LOGSEQ_DIR}" || error "Could not change to ${LOGSEQ_DIR}"

  # Pull the latest changes from the remote repository
  echo "Pulling latest changes..."
  if ! git pull; then
    error "Failed to pull latest changes from the remote repository."
  fi

  # Add all the files to the staging area
  echo "Adding files to the staging area..."
  git add .

  # Commit the changes with a more descriptive commit message
  echo "Commmitting files..."
  if git commit -m "Logseq update: $(date +'%Y-%m-%d %H:%M:%S')"; then
    # Push the changes to the remote repository
    echo "Pushing changes to the remote repository..."
    if ! git push; then
      error "Failed to push changes to the remote repository."
    fi
  else
    echo "Nothing to commit. Your graph is already up to date."
  fi

  success "Synchronised Logseq graph with the GitHub repository."
}

main "$@"
