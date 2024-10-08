# Initialisation des valeurs attendu
ip=$(ip a | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d'/' -f1)
hostname=$(cat /etc/hostname)
distrib=$(grep '^PRETTY_NAME' /etc/os-release | cut -d'"' -f2)
user=$USER

MAX_SIZE=1000

# Vérifier la taille du fichier
file_size=$(stat -c%s /etc/motd)

if [ "$file_size" -ge "$MAX_SIZE" ]; then
    sudo truncate -s 0 /etc/motd
fi

asciiDebian="
                      &&                          
                &&#BGGGGGGBBBGGB#&&               
             &BGPPPPPPPPPPPPPPPPPPPGGGB&&         
          &BGPPPPPPPGBB########BBGPPPPPPPG#       
        #GPPPPPPGB#&              &#BPPPPPPG#     
      &GPPPPPGB&                      #GPPPPPG&   
     &GPPPG#&                           BPPPPPP#  
    #GPPG#                               #PPPB#B  
   BPPP#                &#BBB###&         BPPP#   
  #PPPB               #GB#&     &&        &PPPB   
 &PPPB              &GB                    GPPG   
 #PPP&             &G#                     GPPP&  
 &PPG              BG               &      GPPB   
 #PPB              BP&                     GPG    
 #PPB              #PB            &&     &GPG     
 &PPB               BPB       &&        #PP#      
 &PPP&             &&#GG#&           &#GPB&       
  BPPB                &#BGGB#&&&##BBGGB#          
  &PPP#                 &#BBBBBBBB##&             
   #PPPPB                                         
    BPPPG&                                        
     #PPPG                                        
      &GPPB                                       
        BPPG#                                     
         &BPPG&                                   
           &BGPG#&                                
              &BGGB#&                             
                 &#BGB#&&                         
                      &&&&&                                         
"
asciiUbuntu="

                                                  
                &#BGP55YYYY55PGB#&                
            &BPYJ????????????????JYPB&            
          #5J????????????????????????J5#          
        BY????????????????????!:::~?????YB        
      #Y?????????????77!!!!7?!     ^??????Y#      
     G???????????7?!.       :7^...:7????????G     
    G??????????!: ^7^ ..::..  ^~~~!??????????G    
   B?????????7:    ~?77?????7~:    :7?????????B   
   J????????7.   :7????????????!:   .7????????J   
  B????7!~~7!   :????????????????:   :?????????B  
  G???7.    ~!  !????????????????7^^^^?????????G  
  G???7.    ~!  !????????????????7^^^^?????????G  
  B????7!~~7!   :????????????????:   :?????????B  
   J????????7.   :!????????????!:   .7????????J   
   B?????????7:    ~?77?????7~:    :7?????????B   
    G??????????!: ^7^ ..::..  ^~~~!??????????G    
     G???????????7?!.       :7^...:7????????G     
      #Y?????????????77!!!!7?!     ^??????Y#      
        BY????????????????????!:::~?????YB        
          #5J????????????????????????J5#          
            &BPYJ????????????????JYPB&            
                &#BGP55YYYY55PGB#&                
                                                                                
"
asciiKali="
               &#GP55YYYYYYYY55PG#&               
           &BP5YYYYYYYYYYYYYYYYYYYY5PB&           
        &B5YYYYYYYYYYYYYYYYYYYYYYYYYYYY5B&        
      &PYJYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYG&      
     GJJYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYG     
   P?!!!!!~~~~~~~!77?JYYYYYYYYYYYYYYYYYYYYYYY5&   
  #YYYYYYYYJJJ??7!~:..:^JYYYYYYYYYYYYYYYYYYYYYY#  
 G7!!!!~~~~~!!!!!~^:    75YYYJYYYYYYYYYYYYYYYYYY& 
#???JJJYYYYJ?7!~~~~!!77!:!???7!!7?YYYYYYYYYYYYYY5 
GJJJJJJ7!~^~!7JJYYYYY5Y7  .:::^^~~~!JYYYYYYYYYYYYB
YJJJ7~~!?JYYYYYYYYYYYJ: 7YYYYYJ?!~^..7YYYYYYYYYYY5
JJJJJJYYJJJJJJJJJJJYY^ 75YYYYYYY55Y!:.!JYYYYYYYYYY
JJJJJJJJJJJJJJJJJJJJY~ !YYYYYYYYYYY55J!JYYYYYYYYY5
YJJJJJJJJJJJJJJJJJJJJY~ ^7?JJJJJYYYYY55YYYYYYYYYYP
BJJJJJJJJJJJJJJJJJJJJJYJ!^::::::::^~7?JYYYYYYYYYYB
 5JJJJJJJJJJJJJJJJJJJJJYYYYYYYYJJ7~. :^^7YYYYYYYP 
 &YJJJJJJJJJJJJJJJJJJJJJJJJJJYYYYYYY?^~?!:?YYYY5& 
  #YJJJJJJJJJJJJJJJJJJJJJJJJJJJYYYYYYY!:JJ:JYY5&  
   &5JJJJJJJJJJJJJJJJJJJJJJJJJJJJJYYYYY!.YYJYG&   
     BYJJJJJJJJJJJJJJJJJJJJJJJJJJJJJYYYY^!Y5B     
      &G5JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJYJJB       
        &BPYJJJJJJJJJJJJJJJJJJJJJJJJJY5G#         
           &#G5YJJJJJJJJJJJJJJJJJY5PG#&           
               &#BGP55YYYYY55PPGB#&                      
"

# Affichage des infos
echo "Adresse IP : $ip"
echo "Nom d'hote : $hostname"
echo "Distribution : $distrib"
echo "Utilisateur : $user"
if [ "$distrib" = "Debian GNU/Linux 12 (bookworm)" ]; then
    echo "$asciiDebian"
elif [ "$distrib" = "Ubuntu 22.04 LTS" ]; then
    echo "$asciiUbuntu"
else
    echo "$asciiKali"
fi
