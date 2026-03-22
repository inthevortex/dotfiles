#!/usr/bin/env bash

PR_NUMBER=$1

if [[ -z "$PR_NUMBER" ]]; then
    exit 1
fi

PROJECT_NAME=$(basename "$PWD")

# Route to the correct centralized worktree folder
if [[ "$PWD" == *"/Code/Work"* ]]; then
    WT_ROOT="$HOME/Code/Work/pr-worktrees"
elif [[ "$PWD" == *"/Code/Personal"* ]]; then
    WT_ROOT="$HOME/Code/Personal/pr-worktrees"
else
    # Fallback if launched from somewhere else
    WT_ROOT="$(dirname "$PWD")/pr-worktrees"
fi

TARGET_DIR="$WT_ROOT/${PROJECT_NAME}-pr${PR_NUMBER}"

# Ensure the root pr-worktrees folder exists
mkdir -p "$WT_ROOT"

# If the worktree already exists, just open it and exit
if [[ -d "$TARGET_DIR" ]]; then
    nohup code "$TARGET_DIR" >/dev/null 2>&1 &
    exit 0
fi

# Create a detached worktree (no branch specified yet)
git worktree add -d "$TARGET_DIR"

# Navigate into the new worktree
cd "$TARGET_DIR" || exit 1

# Let the GitHub CLI natively fetch the PR and check out the exact branch name
gh pr checkout "$PR_NUMBER"

# Launch VSCode disconnected from the terminal
nohup code "$TARGET_DIR" >/dev/null 2>&1 &