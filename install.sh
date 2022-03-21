mkdir ~/dnfuzz
cd ~/dnfuzz && { curl -O https://raw.githubusercontent.com/saturn279/dnfuzz/main/dnfuzz.sh ; cd -; }
echo "alias dnfuzz='bash ~/dnfuzz/dnfuzz.sh'" >> ~/.bashrc
echo "alias dnfuzz='bash ~/dnfuzz/dnfuzz.sh'" >> ~/.zshrc
printf "\nRestart your terminal to finish installation.\n"

