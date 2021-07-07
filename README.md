# Stremio-RaspberryPi    

## Steps to run Stremio in Raspberry Pi   

###  Clone the git project    
```   
git clone https://github.com/shivasiddharth/Stremio-RaspberryPi
```   

###  Make the scripts executable  
```
sudo chmod +x /home/${USER}/Stremio-RaspberryPi/scripts/installer.sh  
sudo chmod +x /home/${USER}/Stremio-RaspberryPi/scripts/service-installer.sh    
sudo chmod +x /home/${USER}/Stremio-RaspberryPi/src/server-launcher.sh    
sudo chmod +x /home/${USER}/Stremio-RaspberryPi/src/client-launcher.sh  
```   

###  Run the installer  
```   
sudo /home/${USER}/Stremio-RaspberryPi/scripts/installer.sh
```   

###  After the installation, try opening the Stremio server and client manually using the following   
Open first terminal and run    
```   
/home/${USER}/Stremio-RaspberryPi/src/server-launcher.sh  
```    

Open second terminal and run   
```   
/home/${USER}/Stremio-RaspberryPi/src/client-launcher.sh  
```    

###  After verification if desired, set Stremio to auto start on boot (VLC controls do not work on auto start)   
Run the service installer  
```   
sudo /home/${USER}/Stremio-RaspberryPi/scripts/service-installer.sh        
```   

Enable and start the service   
```   
sudo systemctl enable stremio-server.service   
sudo systemctl enable stremio-client.service   
sudo systemctl start stremio-server.service   
sudo systemctl start stremio-client.service  
```    

### Fix for screen tearing    
Open a terminal and run   
```    
sudo raspi-config     
```   
In that, Navigate to Advanced Options -> Compositor -> xcompmgr composition manager -> Choose “No”     


### Note     
 - If you want to play videos using VLC:      
   1. DO NOT set the Stremio Server and Client to auto start on boot.
   2. Use the shortcuts on the Desktop or the commands given above to manually launch the Service and Client.
   3. Always launch the Server first and after a couple of seconds, launch the Client.     

 - If you have enabled the Client Service and exited the Stremio interface in the browser, open a terminal and run ```sudo systemctl restart stremio-client.service```.   

 - If you did not enable the Client Service and exited the Stremio interface in the browser, use the Client-Launcher shortcut on the Desktop to start the client again.     
