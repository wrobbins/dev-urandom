#!/usr/bin/env zsh

source ~/.local/bin/check-os.zsh

programs=(
  "fnm"
  "nvim"
  "wl-copy"
  "wl-paste"
  "duf"
  "dust"
  "rg"
  "exa"
)

if [[ "$OS_TYPE" == *"Fedora"* ]]; then
	programs+=("bat")
	programs+=("fd")
elif [[ "$OS_TYPE" == *"Ubuntu"* ]]; then
	programs+=("batcat")
	programs+=("fdfind")
else
    echo "!! This system is neither Fedora nor Ubuntu !!"
fi

check_program() {
  if ! command -v "$1" > /dev/null; then
    echo "$1 is not installed"
  fi
}

for program in "${programs[@]}"; do
  check_program "$program"
done

