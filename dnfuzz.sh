#!/bin/bash
function help() {
    echo "---------Subdomain and hidden directory checking tool---------"
    echo "Usage: dnfuzz -d <domain> -subs <subdomain_list> -dir <directory_list> -P <threadcount>"
    echo "    -h                           Print this help text and exit"
    echo "    -d                           Domain name [example.com] "
    echo "    -subs                        Text file with list of subdomains [subslist.txt]"
    echo "    -dir                         Text file with list of directories [dirslist.txt]"
    echo "    -P                           Number of threads for xargs"
    echo "Example: dnfuzz -d github.com -subs subslist.txt -dir dirslist.txt -P 500"
}
function tools() {
    type -P host &>/dev/null
    if [ ! $? -eq 0 ]; then
        echo "Error: Please install host command and run again."
        exit 127
    fi
    type -P curl &>/dev/null
    if [ ! $? -eq 0 ]; then
        echo "Error: Please install cURL command and run again."
        exit 127
    fi

}
function main() {

    xargs -a $subdomain_list -I@ -P$threads sh -c "host \"@\".$target" | grep -wv 'not found' | awk '{print $1}' | sort -u | xargs -I@ -P$threads sh -c "xargs -a $dir_list -I^  -P10 sh -c 'echo \"curl -ks https://\"@\"/\"^\" -w \"%{http_code}\" -o /dev/null\";'" | xargs -I@ -P500 sh -c 'codeh=$(@);if [ "$codeh" -eq "200" ]; then echo "@";  fi' | awk '{print $3}'

}
function arg() {
    while :; do
        case $1 in
        '-d')
            target=$2
            shift
            ;;
        '-subs')
            subdomain_list=$2
            shift
            ;;
        '-dir')
            dir_list=$2
            shift
            ;;
        '-P')
            threads=$2
            shift
            ;;
        '-h')
            help
            exit 0
            ;;
        "")
            shift
            break
            ;;
        *)
            echo "Error: Unknown Option: $1"
            echo "Usage: bash script -h"
            exit 1
            ;;
        esac
        shift
    done
}
arg $@
tools
if [ ! -z "$target" ]; then
    main
else
    echo "[!]Error: please provide domain, subslist, dirslist, threadcount, or look for help -h"
    exit 1
fi
