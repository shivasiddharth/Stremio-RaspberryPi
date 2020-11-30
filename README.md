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

###  After verification if desired, set Stremio to auto start on boot   
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

.. note::
 - If you have enabled the Client Service and exited the browser, use the Client-Service shorcut to restart the client service.   
 - If you did not enable the Client Service, use the Client-Launcher shortcut to start the client again.    
