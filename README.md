# dnfuzz
Subdomain and hidden directory checking tool with multithreading support.

# Installation

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/saturn279/dnfuzz/main/install.sh)"
    
OR 

    git clone https://github.com/saturn279/dnfuzz
    cd dnfuzz
    bash ./dnfuzz -d github.com -subs ./wordlists/subslist.txt -dir ./wordlists/dirslist.txt -P 500 

    
    
# Description
  **dnfuzz** is an command line script for recon which can search through a list of subdomains while performing directory fuzzing.
    
    dnfuzz -d <domain> -subs <subdomain_list> -dir <directory_list> -P <threadcount> 
# Options
    -h                                   Print this help text and exit
    -d                                   Domain name [example.com] 
    -subs                                Text file with list of subdomains [subslist.txt]
    -dir                                 Text file with list of directories [dirslist.txt]
    -P                                   Number of threads for xargs
# Examples

![Terminal](https://github.com/saturn279/dnfuzz/raw/main/screenshots/examples.png)
![htop](https://github.com/saturn279/dnfuzz/raw/main/screenshots/htop.png)
