# week 7  

## Prerequisite  

1. install docker in windows or linux [reference](https://docs.docker.com/desktop/?_gl=1*1vh7cu1*_gcl_au*MTY4MjUxNzY3OS4xNzM3NDcxMDQx*_ga*MTcxMDIxMzg4My4xNzM0NjIwODQz*_ga_XJWPQMJYHQ*MTc0MDkyMzMxMy41NC4xLjE3NDA5MjM5MDguNTguMC4w)  
2. download and install vs-code [reference](https://code.visualstudio.com/download)  
3. install the docker extension in the vs-code [reference](https://code.visualstudio.com/docs/containers/overview)  

## Setting up the development environment   

1. run the following command to pull the docker image    
    `docker image pull dinusha94senz/bootcamp-2025:arm-session-2`  

2. run the following command to get the docker image ID for the pulled image  
    `docker images`  

3. start the docker container  
    `docker run -it <Image ID> bash`  

4. starting directory will not be `workspace` , so change the working directory to `workspace`  

5. clone the git repository and move into the `boot-camp-2025` folder.  
    `git clone https://github.com/dinusha94/boot-camp-2025.git`  

6. initiate the submodules  
    `git submodule update --init --recursive`  

# week 8  