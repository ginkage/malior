#/bin/bash
echo "Download malior.."
sudo wget -q https://github.com/ChisBread/malior/raw/main/malior -O /usr/local/bin/malior
sudo chmod +x /usr/local/bin/malior
cat > /tmp/malior-sudo <<EOF
MALIOR_EXEC_USER=root malior \$*
EOF
sudo mv /tmp/malior-sudo /usr/local/bin/malior-sudo
sudo chmod +x /usr/local/bin/malior-sudo
echo "Done."
echo "Initialize configuration directory.."
[ ! -d ~/.config/malior ] && mkdir -p ~/.config/malior
[ ! -d ~/.local/malior/bin ] && mkdir -p ~/.local/malior/bin
[ ! -d ~/.local/malior/share ] && mkdir -p ~/.local/malior/share
cat > ~/.config/malior/envs.sh <<EOF
export XONOTIC_DIR=~/.local/malior/xonotic
export PATH=~/.local/malior/bin:/usr/games:\$PATH
export USER=\$(whoami)
EOF
echo "Done."