# Initialisation des valeurs attendu
ip=$(ip a | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d'/' -f1)
hostname=$(cat /etc/hostname)
distrib=$(grep '^PRETTY_NAME' /etc/os-release | cut -d'"' -f2)
user=$USER

asciiDebian="
                                            %%%%%%%%%%%%                                            
                                        #%%%%%%%%%%%%%%%%%%%%%%                                     
                                     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                  
                                   %%%%%%%%%%%%%        %%%%%%%%%%%%                                
                                 %%%%%%%%%%%%               %%%%%%%%%%                              
                                %%%%%%%%%                     %%%%%%%%%                             
                             % %%%%%%%                          %%%%%%%%                            
                             %%%%%%%                             %%%%%%%                            
                             %%%%%                %%%%%%%         %%%%%%                            
                           %%%%%%              %%%%      %%       %%%%% %                           
                           %%%%%              %%%                  %%%%                             
                           %%%%%             %%                    %%%%%                            
                           %%%%%            %%%             %%     %%%%                             
                           %%%%             %%%                    %%%%                             
                           %%%%             %%%            %      %%%%                              
                           %%%%             %%%%                 %%%%                               
                           %%%%%             %%%%               %%%%                                
                            %%%%            %%%%%%%         %%%%%%                                  
                            %%%%               %%%%%%%%%%%%%%%%%                                    
                             %%%%%                %%%%%%%%%                                         
                             %%%%%%                    %                                            
                              %%%%%                                                                 
                               %%%%%                                                                
                                %%%%%                                                               
                                 %%%%%                                                              
                                   %%%%%                                                            
                                    %%%%%%                                                          
                                      %%%%%%                                                        
                                         %%%%%%                                                     
                                             %%%%%%%
"

# Affichage des infos
echo "Adresse IP : $ip"
echo "Nom d'hote : $hostname"
echo "Distribution : $distrib"
echo "Utilisateur : $user"
if [ "$distrib" = "Debian GNU/Linux 12 (bookworm)" ]; then
    echo "$asciiDebian"
fi
