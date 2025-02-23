!/bin/bash
set -euo pipefail

check_aws_cli() {
    if command -v aws &> /dev/null && aws --version &> /dev/null; then
        echo "AWS CLI is installed: $(aws --version)"
        return 0
    else
        echo "AWS CLI is not installed or not working."
        return 1
    fi
}

install_aws_cli() {
    echo "Installing AWS CLI v2 on Linux..."

    # Detect architecture
    ARCH=$(uname -m)
    case "$ARCH" in
        x86_64) URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" ;;
        aarch64) URL="https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" ;;
        *) echo "Error: Unsupported architecture: $ARCH" >&2; exit 1 ;;
    esac

    # Install dependencies
    for cmd in curl unzip; do
        if ! command -v "$cmd" &> /dev/null; then
            echo "Installing $cmd..." >&2
            sudo apt-get update && sudo apt-get install -y "$cmd" || {
                echo "Failed to install $cmd" >&2
                exit 1
            }
        fi
    done

    # Clean up any broken install
    if [ -d "/usr/local/aws-cli" ] || [ -f "/usr/local/bin/aws" ]; then
        echo "Removing existing AWS CLI installation..."
        sudo rm -rf /usr/local/aws-cli /usr/local/bin/aws /usr/local/bin/aws_completer
    fi

    # Download and install with --update
    curl "$URL" -o "awscliv2.zip" || { echo "Error: Failed to download AWS CLI" >&2; exit 1; }
    unzip awscliv2.zip || { echo "Error: Failed to unzip AWS CLI" >&2; exit 1; }
    sudo ./aws/install --update || { echo "Error: AWS CLI installation failed" >&2; exit 1; }