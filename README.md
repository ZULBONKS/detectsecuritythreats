## Security Threat Detection Script Documentation

Overview

This script is designed to detect signs of backdoors, eavesdropping, and man-in-the-middle (MITM) attacks on Linux systems. It assesses the system's security status using standard tools and commands, such as chkrootkit, rkhunter, netstat, arp, and cat /etc/resolv.conf.

Features

•
Backdoor/Rootkit Detection: Detects known backdoors and rootkits, as well as system file tampering, using chkrootkit and rkhunter.

•
Eavesdropping/Monitoring Detection: Checks whether network interfaces are in promiscuous mode, displays established network connections and listening ports with the netstat command, and identifies suspicious connections and services.

•
Man-in-the-Middle (MITM) Detection: Checks the ARP cache for signs of ARP spoofing and reads /etc/resolv.conf to verify the legitimacy of the DNS resolver.

•
Report Generation: Script execution results are saved to a time-stamped text file.

•
Multilingual Support: Supports four languages: English (en), Chinese (zh), Brazilian Portuguese (pt_BR), and Japanese (ja).

•
ABOUT Option: Provides an overview of the script and explains basic Bash functionality.

•
Conclusion and Warnings: At the end of each security check, explanations of the results and recommended actions are provided.

•
Formatted Message Display: Each message is formatted in a special format that displays it simultaneously in four languages.

Usage

1.
Download or create the script and grant execution permissions.

2.
Run the script with root privileges. If required tools are not installed, the script will automatically attempt to install them.

3.
Select Language: You can specify a language using the -l option. Example:

4.
Display ABOUT Information: You can display information about the script and Bash using the -a option.

5.
After execution, a report file with the format security_threat_report_YYYYMMDD_HHMMSS.txt will be generated. This file contains all output displayed during the script's execution.

•
chkrootkit/rkhunter Warning: These tools may report false positives. If you receive a warning, investigate it further to determine whether it is legitimate or a known false positive.

•
Suspicious network connections: Unrecognized processes or ports communicating externally in netstat output may indicate malware or unauthorized services.

•
Promiscuous interfaces: A network interface in promiscuous mode typically indicates a network monitoring tool is running, but it may be an indication of unintended eavesdropping.

•
ARP cache inconsistencies: Inconsistent or duplicate ARP entries in the arp -a output may indicate an ARP spoofing attack.

•
DNS resolver changes: Unexpected DNS servers configured in /etc/resolv.conf may indicate DNS hijacking.

Conclusion and warning function

The script provides the following information at the end of each security check:

Backdoor/rootkit detection

•
Conclusion: Carefully review the output of chkrootkit and rkhunter for any "warning" or "infected" status.

•
Warning: False positives may occur, so cross-check other security measures and manually investigate any suspicious items.

Eavesdropping/Surveillance Detection

•
Conclusion: Check for intentionally unconfigured promiscuous interfaces and analyze for unknown or unauthorized services/processes.

•
Warning: Unrecognized network activity may indicate malware or unauthorized surveillance.

MITM Detection

•
Conclusion: Check the ARP cache for duplicate or anomalous MAC-IP mappings and verify DNS resolvers against trusted sources.

•
Warning: Anomalies in ARP or DNS configuration are strong indicators of an MITM attack.

Supported Languages

•
English (en): English

•
Chinese (zh): 中文

•
Português (Brazil) (pt_BR): Português (Brasil)

•
Japanese (ja): 日本語

Notes

•
This script is intended to assist in detecting security threats and is not a complete security solution.

•
Running the script requires root privileges.

•
An internet connection is required to install the tools (chkrootkit, rkhunter, net-tools).

•
System modifications and configuration checks are performed at your own risk.

•
Carefully review the conclusions and warnings of each scan and take further investigation or action as necessary.

•
Messages are displayed simultaneously in four languages, so output may be lengthy.
