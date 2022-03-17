#!/bin/bash
function help() {
        echo "+++++++++++++++++++++++++"
        echo "Subdomain Enum & Fuzzing"
        echo "+++++++++++++++++++++++++"
        echo "-d                :       Domain as target"
        echo "-subs             :       Subdomain wordlist"
        echo "-dir              :       Dir wordlist"
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
        while read -r subs; do
                if host $subs.$target &>/dev/null; then
                        while read -r dir; do
                                code=$(curl -ks "https://$subs.$target/$dir" -w "%{http_code}" -o /dev/null)
                                if [ "$code" -eq "200" ]; then
                                        echo "https://$subs.$target/$dir  : 200 "
                                fi
                        done <$dir_list
                fi
        done <$subdomain_list
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
        echo "[!]Error: please provide domain, or look for help -h"
        exit 1
fi
