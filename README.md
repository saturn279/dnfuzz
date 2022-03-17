# dnfuzz
Subdomain and hidden directory checking tool. 

# Installation

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/saturn279/dnfuzz/main/install.sh)"
    
# Description
  **dnfuzz** is an command line script for recon which can loop through a list of subdomains while performing directory fuzzing.
    
    dnfuzz -d DOMAIN [OPTIONS]  
# Options
    -h                                   Print this help text and exit
    -d                                   Domain name [example.com] 
    -subs                                Text file with list of subdomains [subslist.txt]
    -dir                                 Text file with list of directories [dirslist.txt]
    
