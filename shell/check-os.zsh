#!/bin/zsh

# Function to check OS and set OS_TYPE variable
check_os() {
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        
        case $ID in
            fedora)
                OS_TYPE="Fedora"
                ;;
            ubuntu)
                OS_TYPE="Ubuntu"
                ;;
            *)
                OS_TYPE="Unknown Linux Distribution"
                ;;
        esac
    else
        OS_TYPE="Unable to determine OS type"
    fi
}

# Call the function to set the OS_TYPE variable
check_os

# Optionally, you can add this line to your .zshrc to execute the function every time zsh starts
# eval $(cat <<EOF
# check_os
# EOF
# )

