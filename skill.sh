#!/usr/bin/env bash

declare -A SKILLS=(
  [living-docs]="skills/living-docs/SKILL.md"
  [code-docs]="skills/code-docs/SKILL.md"
  [changelog-gen]="skills/changelog-gen/SKILL.md"
)

if [[ $# -eq 0 ]]; then
  echo "Usage: source ./skill.sh <skill-name>"
  echo "Available skills: ${!SKILLS[@]}"
else
  echo "${SKILLS[$1]}"
fi
