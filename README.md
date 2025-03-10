# Week 7  

## Prerequisite  

1. install docker in windows or linux [reference](https://docs.docker.com/desktop/?_gl=1*1vh7cu1*_gcl_au*MTY4MjUxNzY3OS4xNzM3NDcxMDQx*_ga*MTcxMDIxMzg4My4xNzM0NjIwODQz*_ga_XJWPQMJYHQ*MTc0MDkyMzMxMy41NC4xLjE3NDA5MjM5MDguNTguMC4w)  
2. download and install vs-code [reference](https://code.visualstudio.com/download)  
3. install the docker extension in the vs-code [reference](https://code.visualstudio.com/docs/containers/overview)  

## Setting up the development environment  

### Setting up the linux development environment  

For this session you need to have an linux development environment, follow the instructions bellow to set it up

1. [Install vmware in your PC](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)  
2. For compatibility we need to use `Ubuntu 20.04.6 LTS`, ISO image is provided in the resources folder, using that Image create a Ubuntu    virtual  machine.  
3. Once the ubuntu vm is running, install vs code from the ubuntu software installer tool  
4. Open a terminal and use following command to install docker  
    `sudo apt  install docker.io`  
5. To connect `vscode` to docker container we need to provide permission to the docker user. run the following commands and reboot the vm  
    `sudo groupadd docker`  
	`sudo usermod -aG docker $USER`  
	`newgrp docker`  
    `sudo reboot`  

6. Install the following extensions in vs code  
    `Docker`  
    `Dev Containers`  
    `Remote Explorer`  

### pull the docker images and codes  

1. run the following command to pull the docker image    
    `docker image pull dinusha94senz/bootcamp-2025:arm-session-1`    
    `docker image pull dinusha94senz/bootcamp-2025:arm-session-2`    

2. run the following command to get the docker image ID for the pulled image  
    `docker images`  

3. start the docker container  
    `docker run -it <Image ID> bash`  

4. starting directory will not be `workspace` or `home` , so change the working directory to `workspace`  or `home`  

5. clone the git repository and move into the `boot-camp-2025` folder.  
    `git clone https://github.com/dinusha94/boot-camp-2025.git`  

6. initiate the submodules  
    `git submodule update --init --recursive`  


# Week 8  