# bash_scripts
Simple scripts written in bash

## climb.sh  
This script makes it easier for people to move upwards in the directory tree when using the terminal.  
Typically you will have to type cd commands with a lot of dots and slashes to get to your desired parent-folder,
but with this script installed, you can simply write "climb N" where N is the number of levels you wish to climb in the directory tree.

#### Usage
For this script to work optimally, you should create an alias that refers to the script.  
This can be done by adding the following line to the bashrc file:  
    ```alias climb="source <FILE_PATH>; climb"```   
Where <FILE_PATH> is replaced with the file path of the script.

The bashrc file can be accessed by writing the following line to the terminal (assumes you have gedit installed):  
    ```gedit ~/.bashrc```  
 
 
## track.sh
This is a very basic time tracking script that I made just to experiment...
