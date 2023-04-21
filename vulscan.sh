#!/bin/bash

# This script will scan a web application for vulnerabilities

# Get the target URL from user input
read -p "Enter the target IP or website URL: " target_url

# Use nmap to scan for open ports and services
nmap -p- $target_url

# Use nikto to scan for known vulnerabilities
nikto -h $target_url

# Use OWASP ZAP to perform a more comprehensive vulnerability scan
zap-cli -p 8080 -t $target_url -f html -o report.html -m quick-scan

# Use wpscan to scan for vulnerabilities in WordPress sites
wpscan --url $target_url

# Use sqlmap to scan for SQL injection vulnerabilities
sqlmap -u $target_url --batch --level=5 --risk=3 --dbs

# Use dirb to scan for common directories and files
dirb $target_url
