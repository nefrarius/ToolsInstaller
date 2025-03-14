#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

clear

banner="${turquoiseColour} ███████████                   ████             █████                     █████              ████  ████                    
░█░░░███░░░█                  ░░███            ░░███                     ░░███              ░░███ ░░███                    
░   ░███  ░   ██████   ██████  ░███   █████     ░███  ████████    █████  ███████    ██████   ░███  ░███   ██████  ████████ 
    ░███     ███░░███ ███░░███ ░███  ███░░      ░███ ░░███░░███  ███░░  ░░░███░    ░░░░░███  ░███  ░███  ███░░███░░███░░███
    ░███    ░███ ░███░███ ░███ ░███ ░░█████     ░███  ░███ ░███ ░░█████   ░███      ███████  ░███  ░███ ░███████  ░███ ░░░ 
    ░███    ░███ ░███░███ ░███ ░███  ░░░░███    ░███  ░███ ░███  ░░░░███  ░███ ███ ███░░███  ░███  ░███ ░███░░░   ░███     
    █████   ░░██████ ░░██████  █████ ██████     █████ ████ █████ ██████   ░░█████ ░░████████ █████ █████░░██████  █████    
   ░░░░░     ░░░░░░   ░░░░░░  ░░░░░ ░░░░░░     ░░░░░ ░░░░ ░░░░░ ░░░░░░     ░░░░░   ░░░░░░░░ ░░░░░ ░░░░░  ░░░░░░  ░░░░░  ${endColour}"

echo -e "$banner"
echo -e "\n \n Do you want to upgrade and update the system before all?(Y/N): "
read updatenupgrade

if [[ $updatenupgrade == "Y" || $updatenupgrade == "y" ]];then
    sudo apt update -y && sudo apt upgrade -y
else
    echo "Not upgrading"
    sleep 4
fi

clear

echo -e "$banner"

echo -e "${greenColour}[1] Metasploit Framework      [2] Nmap                 [3] Nikto
[4] WhatWeb                   [5] Bettercap            [6] Ffuf (Fuzz Faster U Fool)
[7] sqlmap                    [8] John the Ripper      [9] Hydra
[10] Dirsearch                [11] Gobuster            [12] Responder
[13] Impacket                 [14] Hashcat             [15] Aircrack-ng
[16] Sublist3r                [17] Amass               [18] TheHarvester
[19] XSStrike                 [20] ZAP (OWASP Zed)     [21] Sn1per
[22] OWASP Nettacker          [23] FinalRecon          [24] Lockdoor Framework
[25] Modlishka                [26] cloudfox            [27] BloodHound
[28] Evil-WinRM               [29] PayloadsAllTheThings [30] SecLists ${endColour}"

echo -e "\nroot@Installer> "
read option

case $option in

    1)
        echo -e "Installing Metasploit Framework..."
        curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
        chmod 755 msfinstall && \
        ./msfinstall
    ;;

    2)
        echo "Installing Nmap..."
        git clone https://github.com/nmap/nmap /tmp/nmap && \
        cd /tmp/nmap && \
        ./configure && make && sudo make install
    ;;

    3)
        echo "Installing Nikto..."
        git clone https://github.com/sullo/nikto /tmp/nikto && \
        sudo mv /tmp/nikto/nikto.pl /usr/local/bin/nikto && \
        sudo chmod +x /usr/local/bin/nikto
    ;;

    4)
        echo "Installing WhatWeb..."
        git clone https://github.com/urbanadventurer/WhatWeb /tmp/whatweb && \
        sudo mv /tmp/whatweb/whatweb /usr/local/bin/whatweb && \
        sudo chmod +x /usr/local/bin/whatweb
    ;;

    5)
        echo "Installing Bettercap..."
        sudo apt install -y bettercap
    ;;

    6)
        echo "Installing Ffuf..."
        git clone https://github.com/ffuf/ffuf /tmp/ffuf && \
        cd /tmp/ffuf && go build && \
        sudo mv ffuf /usr/local/bin/ffuf
    ;;

    7)
        echo "Installing sqlmap..."
        git clone https://github.com/sqlmapproject/sqlmap /tmp/sqlmap && \
        sudo mv /tmp/sqlmap/sqlmap.py /usr/local/bin/sqlmap && \
        sudo chmod +x /usr/local/bin/sqlmap
    ;;

    8)
        echo "Installing John the Ripper..."
        git clone https://github.com/openwall/john /tmp/john && \
        cd /tmp/john/src && \
        ./configure && make && sudo make install
    ;;

    9)
        echo "Installing Hydra..."
        git clone https://github.com/vanhauser-thc/thc-hydra /tmp/hydra && \
        cd /tmp/hydra && \
        ./configure && make && sudo make install
    ;;

    10)
        echo "Installing Dirsearch..."
        git clone https://github.com/maurosoria/dirsearch /tmp/dirsearch && \
        sudo mv /tmp/dirsearch/dirsearch.py /usr/local/bin/dirsearch && \
        sudo chmod +x /usr/local/bin/dirsearch
    ;;

    11)
        echo "Installing Gobuster..."
        git clone https://github.com/OJ/gobuster /tmp/gobuster && \
        cd /tmp/gobuster && go build && \
        sudo mv gobuster /usr/local/bin/gobuster
    ;;

    12)
        echo "Installing Responder..."
        git clone https://github.com/lgandx/Responder /tmp/responder && \
        sudo mv /tmp/responder/Responder.py /usr/local/bin/responder && \
        sudo chmod +x /usr/local/bin/responder
    ;;

    13)
        echo "Installing Impacket..."
        git clone https://github.com/SecureAuthCorp/impacket /tmp/impacket && \
        cd /tmp/impacket && pip install .
    ;;

    14)
        echo "Installing Hashcat..."
        git clone https://github.com/hashcat/hashcat /tmp/hashcat && \
        cd /tmp/hashcat && make && \
        sudo mv hashcat /usr/local/bin/hashcat
    ;;

    15)
        echo "Installing Aircrack-ng..."
        sudo apt install -y aircrack-ng
    ;;

    16)
        echo "Installing Sublist3r..."
        git clone https://github.com/aboul3la/Sublist3r /tmp/sublist3r && \
        sudo mv /tmp/sublist3r/sublist3r.py /usr/local/bin/sublist3r && \
        sudo chmod +x /usr/local/bin/sublist3r
    ;;

    17)
        echo "Installing Amass..."
        sudo apt install -y amass
    ;;

    18)
        echo "Installing TheHarvester..."
        git clone https://github.com/laramies/theHarvester /tmp/theharvester && \
        sudo mv /tmp/theharvester/theHarvester.py /usr/local/bin/theharvester && \
        sudo chmod +x /usr/local/bin/theharvester
    ;;

    19)
        echo "Installing XSStrike..."
        git clone https://github.com/s0md3v/XSStrike /tmp/xsstrike && \
        sudo mv /tmp/xsstrike/xsstrike.py /usr/local/bin/xsstrike && \
        sudo chmod +x /usr/local/bin/xsstrike
    ;;

    20)
        echo "Installing ZAP (OWASP Zed)..."
        sudo apt install -y zaproxy
    ;;

    21)
        echo "Installing Sn1per..."
        git clone https://github.com/1N3/Sn1per /tmp/sn1per && \
        cd /tmp/sn1per && sudo bash install.sh
    ;;

    22)
        echo "Installing OWASP Nettacker..."
        git clone https://github.com/OWASP/Nettacker /tmp/nettacker && \
        cd /tmp/nettacker && pip install -r requirements.txt && \
        sudo python3 setup.py install
    ;;

    23)
        echo "Installing FinalRecon..."
        git clone https://github.com/thewhiteh4t/FinalRecon /tmp/finalrecon && \
        sudo mv /tmp/finalrecon/finalrecon.py /usr/local/bin/finalrecon && \
        sudo chmod +x /usr/local/bin/finalrecon
    ;;

    24)
        echo "Installing Lockdoor Framework..."
        git clone https://github.com/SofianeHamlaoui/Lockdoor-Framework /tmp/lockdoor && \
        cd /tmp/lockdoor && sudo bash install.sh
    ;;

    25)
        echo "Installing Modlishka..."
        git clone https://github.com/drk1wi/Modlishka /tmp/modlishka && \
        cd /tmp/modlishka && go build && \
        sudo mv modlishka /usr/local/bin/modlishka
    ;;

    26)
        echo "Installing cloudfox..."
        git clone https://github.com/BishopFox/cloudfox /tmp/cloudfox && \
        cd /tmp/cloudfox && go build && \
        sudo mv cloudfox /usr/local/bin/cloudfox
    ;;

    27)
        echo "Installing BloodHound..."
        sudo apt install -y bloodhound
    ;;

    28)
        echo "Installing Evil-WinRM..."
        gem install evil-winrm
    ;;

    29)
        echo "Installing PayloadsAllTheThings..."
        git clone https://github.com/swisskyrepo/PayloadsAllTheThings /opt/PayloadsAllTheThings
    ;;

    30)
        echo "Installing SecLists..."
        git clone https://github.com/danielmiessler/SecLists /opt/SecLists
    ;;

    0)
        echo "WARNING: This will install all 30 tools. This may take a long time and significant disk space."
        echo "Do you want to continue? (Y/N)"
        read confirm
        if [[ $confirm == "Y" || $confirm == "y" ]]; then
            echo "Installing all tools..."
            for i in {1..30}
            do
                echo "==================================="
                echo "Installing tool number $i"
                echo "==================================="
                case $i in
                    1)
                        echo "Installing Metasploit Framework..."
                        curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
                        chmod 755 msfinstall && \
                        ./msfinstall
                    ;;
                    2)
                        echo "Installing Nmap..."
                        git clone https://github.com/nmap/nmap /tmp/nmap && \
                        cd /tmp/nmap && \
                        ./configure && make && sudo make install
                    ;;
                    3)
                        echo "Installing Nikto..."
                        git clone https://github.com/sullo/nikto /tmp/nikto && \
                        sudo mv /tmp/nikto/nikto.pl /usr/local/bin/nikto && \
                        sudo chmod +x /usr/local/bin/nikto
                    ;;

                     4)
                        echo "Installing WhatWeb..."
                        git clone https://github.com/urbanadventurer/WhatWeb /tmp/whatweb && \
                        sudo mv /tmp/whatweb/whatweb /usr/local/bin/whatweb && \
                        sudo chmod +x /usr/local/bin/whatweb
                    ;;

                    5)
                        echo "Installing Bettercap..."
                        sudo apt install -y bettercap
                    ;;

                    6)
                        echo "Installing Ffuf..."
                        git clone https://github.com/ffuf/ffuf /tmp/ffuf && \
                        cd /tmp/ffuf && go build && \
                        sudo mv ffuf /usr/local/bin/ffuf
                    ;;

                    7)
                        echo "Installing sqlmap..."
                        git clone https://github.com/sqlmapproject/sqlmap /tmp/sqlmap && \
                        sudo mv /tmp/sqlmap/sqlmap.py /usr/local/bin/sqlmap && \
                        sudo chmod +x /usr/local/bin/sqlmap
                    ;;

                    8)
                        echo "Installing John the Ripper..."
                        git clone https://github.com/openwall/john /tmp/john && \
                        cd /tmp/john/src && \
                        ./configure && make && sudo make install
                    ;;

                    9)
                        echo "Installing Hydra..."
                        git clone https://github.com/vanhauser-thc/thc-hydra /tmp/hydra && \
                        cd /tmp/hydra && \
                        ./configure && make && sudo make install
                    ;;

                    10)
                        echo "Installing Dirsearch..."
                        git clone https://github.com/maurosoria/dirsearch /tmp/dirsearch && \
                        sudo mv /tmp/dirsearch/dirsearch.py /usr/local/bin/dirsearch && \
                        sudo chmod +x /usr/local/bin/dirsearch
                    ;;

                    11)
                        echo "Installing Gobuster..."
                        git clone https://github.com/OJ/gobuster /tmp/gobuster && \
                        cd /tmp/gobuster && go build && \
                        sudo mv gobuster /usr/local/bin/gobuster
                    ;;

                    12)
                        echo "Installing Responder..."
                        git clone https://github.com/lgandx/Responder /tmp/responder && \
                        sudo mv /tmp/responder/Responder.py /usr/local/bin/responder && \
                        sudo chmod +x /usr/local/bin/responder
                    ;;

                    13)
                        echo "Installing Impacket..."
                        git clone https://github.com/SecureAuthCorp/impacket /tmp/impacket && \
                        cd /tmp/impacket && pip install .
                    ;;

                    14)
                        echo "Installing Hashcat..."
                        git clone https://github.com/hashcat/hashcat /tmp/hashcat && \
                        cd /tmp/hashcat && make && \
                        sudo mv hashcat /usr/local/bin/hashcat
                    ;;

                    15)
                        echo "Installing Aircrack-ng..."
                        sudo apt install -y aircrack-ng
                    ;;

                    16)
                        echo "Installing Sublist3r..."
                        git clone https://github.com/aboul3la/Sublist3r /tmp/sublist3r && \
                        sudo mv /tmp/sublist3r/sublist3r.py /usr/local/bin/sublist3r && \
                        sudo chmod +x /usr/local/bin/sublist3r
                    ;;

                    17)
                        echo "Installing Amass..."
                        sudo apt install -y amass
                    ;;

                    18)
                        echo "Installing TheHarvester..."
                        git clone https://github.com/laramies/theHarvester /tmp/theharvester && \
                        sudo mv /tmp/theharvester/theHarvester.py /usr/local/bin/theharvester && \
                        sudo chmod +x /usr/local/bin/theharvester
                    ;;

                    19)
                        echo "Installing XSStrike..."
                        git clone https://github.com/s0md3v/XSStrike /tmp/xsstrike && \
                        sudo mv /tmp/xsstrike/xsstrike.py /usr/local/bin/xsstrike && \
                        sudo chmod +x /usr/local/bin/xsstrike
                    ;;

                    20)
                        echo "Installing ZAP (OWASP Zed)..."
                        sudo apt install -y zaproxy
                    ;;

                    21)
                        echo "Installing Sn1per..."
                        git clone https://github.com/1N3/Sn1per /tmp/sn1per && \
                        cd /tmp/sn1per && sudo bash install.sh
                    ;;

                    22)
                        echo "Installing OWASP Nettacker..."
                        git clone https://github.com/OWASP/Nettacker /tmp/nettacker && \
                        cd /tmp/nettacker && pip install -r requirements.txt && \
                        sudo python3 setup.py install
                    ;;

                    23)
                        echo "Installing FinalRecon..."
                        git clone https://github.com/thewhiteh4t/FinalRecon /tmp/finalrecon && \
                        sudo mv /tmp/finalrecon/finalrecon.py /usr/local/bin/finalrecon && \
                        sudo chmod +x /usr/local/bin/finalrecon
                    ;;

                    24)
                        echo "Installing Lockdoor Framework..."
                        git clone https://github.com/SofianeHamlaoui/Lockdoor-Framework /tmp/lockdoor && \
                        cd /tmp/lockdoor && sudo bash install.sh
                    ;;

                    25)
                        echo "Installing Modlishka..."
                        git clone https://github.com/drk1wi/Modlishka /tmp/modlishka && \
                        cd /tmp/modlishka && go build && \
                        sudo mv modlishka /usr/local/bin/modlishka
                    ;;

                    26)
                        echo "Installing cloudfox..."
                        git clone https://github.com/BishopFox/cloudfox /tmp/cloudfox && \
                        cd /tmp/cloudfox && go build && \
                        sudo mv cloudfox /usr/local/bin/cloudfox
                    ;;

                    27)
                        echo "Installing BloodHound..."
                        sudo apt install -y bloodhound
                    ;;

                    28)
                        echo "Installing Evil-WinRM..."
                        gem install evil-winrm
                    ;;

                    29)
                        echo "Installing PayloadsAllTheThings..."
                        git clone https://github.com/swisskyrepo/PayloadsAllTheThings /opt/PayloadsAllTheThings
                    ;;

                    30)
                        echo "Installing SecLists..."
                        git clone https://github.com/danielmiessler/SecLists /opt/SecLists
                    ;;

                esac
                echo "Tool $i installation completed"
                echo "==================================="
                sleep 2
            done
            echo "All tools have been installed!"
        else
            echo "Installation cancelled"
        fi
    ;;
    

    *)
        echo "That isn't an option"
    ;;
esac