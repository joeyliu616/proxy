# proxy
socket5 and http proxy

Usage:
1. socket 5 only
     docker run 
        -e Username={Username} 
        -e Password={Password} 
        -e Server={Server} 
        -d -p 8888:8888 proxy 
2. http proxy only
    docker run 
        -e Username={Username} 
        -e Password={Password} 
        -e Server={Server} 
        -d -p 8118:8118 proxy
