
# dnfuzz - Subdomain and Hidden Directory Checking Tool

`dnfuzz` is a command-line script designed for reconnaissance tasks, allowing you to search for subdomains and perform directory fuzzing on a given domain. This tool supports multithreading for faster execution.

## Installation

You can install `dnfuzz` using the following methods:

### Method 1: Using the Installation Script

Run the following command in your terminal to install `dnfuzz` using the installation script:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/saturn279/dnfuzz/main/install.sh)"
```

### Method 2: Manual Installation

Alternatively, you can clone the repository and run `dnfuzz` directly:

```sh
git clone https://github.com/saturn279/dnfuzz
cd dnfuzz
bash ./dnfuzz -d github.com -subs ./wordlists/subslist.txt -dir ./wordlists/dirslist.txt -P 500
```

## Description

`dnfuzz` is a versatile script that enhances your reconnaissance efforts by searching through a list of subdomains while simultaneously performing directory fuzzing on those subdomains.

### Usage

```sh
dnfuzz -d <domain> -subs <subdomain_list> -dir <directory_list> -P <threadcount>
```

#### Options

- `-h`: Print help text and exit
- `-d`: Domain name (e.g., example.com)
- `-subs`: Text file with a list of subdomains (default: subslist.txt)
- `-dir`: Text file with a list of directories (default: dirslist.txt)
- `-P`: Number of threads for parallel processing

## Examples

Check out these examples to see `dnfuzz` in action:

![Terminal Example](https://github.com/saturn279/dnfuzz/raw/main/screenshots/examples.png)
![htop Example](https://github.com/saturn279/dnfuzz/raw/main/screenshots/htop.png)

## Contribution

Contributions are welcome! If you find any issues or want to enhance the tool, feel free to submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
