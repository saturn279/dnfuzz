mkdir ~/dnfuzz
cd ~/dnfuzz && { curl -O https://raw.githubusercontent.com/saturn279/dnfuzz/main/dnfuzz.sh ; cd -; }
echo -n "alias dnfuzz='bash ~/dnfuzz/dnfuzz.sh'" >> .bashrc
echo -n "alias dnfuzz='bash ~/dnfuzz/dnfuzz.sh'" >> .zshrc
bash 
zsh 

