# Stremio-RaspberryPi
![github-small](https://github.com/shivasiddharth/Stremio-RaspberryPi/blob/Awesome/images/Banner.jpg)     

## **If you like the work and if you would like to get me a :coffee: :smile:** [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7GH3YDCHZ36QN)  





**********        
## Installation Using Binaries (Only Buster and Bullseye)               
**********      
1.  Download the Zip file containing the binaries from the Releases section.      
2.  Place it in the /home/${USER}/ directory and unzip the file.    
3.  Add Debian sources as given below:    
    Buster Users:   
    ```      
    sudo sh -c "echo 'deb http://ftp.us.debian.org/debian/ buster main contrib non-free' >> /etc/apt/sources.list"   
    sudo sh -c "echo 'deb http://deb.debian.org/debian buster main contrib non-free' >> /etc/apt/sources.list"     
    sudo apt-get update     
    ```      
    Bullseye Users:   
    ```      
    sudo sh -c "echo 'deb http://ftp.us.debian.org/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list"    
    sudo sh -c "echo 'deb http://deb.debian.org/debian bullseye main contrib non-free' >> /etc/apt/sources.list"    
    sudo apt-get update     
    ```     
4.  Change directory as given below (Replace x.x.xxx with the version numbers on the file):    
    64-Bit Users:    
    ```    
    cd /home/${USER}/Stremio-x.x.xxx-arm64-64-bit/   
    ```   
    32-Bit Users:    
    ```    
    cd /home/${USER}/Stremio-x.x.xxx-armhf-32-bit/  
    ```
5.  Perform the installation as given below (Replace x.x.xxx with the version numbers on the file):    
    64-Bit Users:    
    ```    
    sudo apt-get install ./libfdk-aac1_0.1.6-1_arm64.deb ./stremio_x.x.xxx-1_arm64.deb -f   
    ```   
    32-Bit Users:    
    ```    
    sudo apt-get install ./libfdk-aac1_0.1.6-1_armhf.deb ./stremio_x.x.xxx-1_armhf.deb -f   
    ```   
6.  Now you should have Stremio installed. Grab some snacks and enjoy the show.       



**********    
##  Building from source (Only 32 Bit)          
**********      
1.  Add Debian sources as given below:    
    Buster Users:   
    ```      
    sudo sh -c "echo 'deb http://ftp.us.debian.org/debian/ buster main contrib non-free' >> /etc/apt/sources.list"   
    sudo sh -c "echo 'deb http://deb.debian.org/debian buster main contrib non-free' >> /etc/apt/sources.list"     
    sudo apt-get update     
    ```      
    Bullseye Users:   
    ```      
    sudo sh -c "echo 'deb http://ftp.us.debian.org/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list"    
    sudo sh -c "echo 'deb http://deb.debian.org/debian bullseye main contrib non-free' >> /etc/apt/sources.list"    
    sudo apt-get update     
    ```   
    Bookworm Users:   
    ```      
    sudo sh -c "echo 'deb http://ftp.us.debian.org/debian/ bookworm main contrib non-free' >> /etc/apt/sources.list"    
    sudo sh -c "echo 'deb http://deb.debian.org/debian bookworm main contrib non-free' >> /etc/apt/sources.list"    
    sudo apt-get update     
    ```   
2.  Clone the stremio-shell using:   
    ```   
    git clone --recurse-submodules -j8 https://github.com/shivasiddharth/stremio-shell.git      
    ```   
3.  Change directory using:    
    ```   
    cd /home/${USER}/stremio-shell/             
    ```
4.  Install dependencies using:     
    ```    
    sed 's/#.*//' ./Requirements.txt | xargs sudo apt-get install -y    
    ```     
5.  Make using:   
    ```   
    qmake    
    ```    
6.  Build binaries using:   
    ```    
    make -f release.makefile    
    ```    
7.  Prepare server using:    
    ```    
    cp ./server.js ./build/ && ln -s "$(which node)" ./build/node     
    ```   
8.  Run Stremio using:   
    ```   
    ./build/stremio    
    ```    
    or   
    ```    
    /home/${USER}/stremio-shell/build/stremio   
    ```     



**********     
## Note     
**********        
1.  After the ```sudo apt-get update``` command for adding sources, if you get a key error like shown below:   
    ![github-small](https://github.com/shivasiddharth/Stremio-RaspberryPi/blob/Awesome/images/Key_Error.png)       
    Fix the issue using (Replace XXXXXXXXXXXX with the first alphanumeric character key):    
    ```    
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys XXXXXXXXXXXX     
    ```      
2.  For remote access of server, go into setting and select your IP address from the **Enable remote HTTPS connections** dropdown menu as shown below.    
    ![github-small](https://github.com/shivasiddharth/Stremio-RaspberryPi/blob/Awesome/images/Remote-connection.png)      
3.  For accessing the Stremio server remotely and securely (Expecially from Apple devices), use the **Streaming HTTPS endpoint:** link as shown below.   
    ![github-small](https://github.com/shivasiddharth/Stremio-RaspberryPi/blob/Awesome/images/Streaming-Server-Link.png)  
