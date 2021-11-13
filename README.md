![github-small](https://github.com/shivasiddharth/Stremio-RaspberryPi/blob/Awesome/images/Banner.jpg)


## **If you like the work and if you would like to get me a :coffee: :smile:** [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7GH3YDCHZ36QN)  



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

###  After the installation, try opening the Stremio server and client manually using the following commands or use the Launcher Shortcuts created on the desktop      
Open first terminal and run    
```   
/home/${USER}/Stremio-RaspberryPi/src/server-launcher.sh  
```    

Open second terminal and run   
```   
/home/${USER}/Stremio-RaspberryPi/src/client-launcher.sh  
```    

###  After verification if desired, set Stremio to auto start on boot     
There will be a minor delay ~1Min between the launch of Server Service and Client Service. This is to ensure that the Client starts after the Server.    
Run the service installer  
```   
sudo /home/${USER}/Stremio-RaspberryPi/scripts/service-installer.sh        
```   

Enable and start the service   
```   
systemctl --user enable stremio-server.service
systemctl --user enable stremio-client.service
systemctl --user start stremio-server.service
systemctl --user start stremio-client.service
```    

### Fix for screen tearing    
Open a terminal and run   
```    
sudo raspi-config     
```   
In that, Navigate to Advanced Options -> Compositor -> xcompmgr composition manager -> Choose “No”     


### Note     
 - If you have closed or stopped the background Stremio services, then if you wish to start them again, you can use the service desktop shortcuts.    
 - You can manually start the Stremio server and client using the Stremio Launcher desktop shortcuts.     
 - If your cursor is stuck after running ```systemctl --user start stremio-server.service```, press Ctrl+C on keyboard to break free.   
 - You can access Stremio on Apple iPads and iPhones with the server running on Raspberry Pi. Refer to https://www.youtube.com/watch?v=cYmpVh_GWJg     
