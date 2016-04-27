# docker-desk

Desk for working with docker. It offers command-line shortcuts for working with docker.
For mor information about Desk visit https://github.com/jamesob/desk

## Instalation
Install and configure desk. https://github.com/jamesob/desk

Copy the docker.sh to your desk folder.

```
cp docker.sh $HOME/.desk/desks/
```

## Available desk commands
`mip [<docker-machine name>]` 
Equivalent to `docker-machine ip <name>`
Example:
`mip default`

`mhosts [<docker-machine name>]`
Adds a entry to your /etc/hosts in the format docker-machine-<name>
Example:  `mhosts default`	

`mredo [<docker-machine name>]`
Destroy and create docker-machine default
Example:
`mredo default`


`mdestroy [<docker-machine name>]`
Equilvalent to `docker-machine rm [name]`
Example:
`mdestroy default`

`mls`
Equivalent to `docker-machine ls`
Example: `mls`

`mssh [<docker-machine name>]`
Equivalent to docker machine ssh [name]
Example:
`mssh default`

`mcreate [<docker-machine name>]`
Equivalent to `docker-machine create --driver=virtualbox [name]`
Example: 
`mcreate default`

`mstop [<docker-machine name>]`
Equivalent to `docker-machine stop [name]`
Example:
`mstop default`


`mstatus [<docker-machine name>]`
Equivalent to `docker-machine status [name]`
Example:
`mstatus default`


`mstart [<docker-machine name>]`
Equivalent to `docker-machine start [name]`
Example:
`mstart default`

`menv [<docker-machine name>]`
Equivalent to `eval "$(docker-machine env [name])"`
Example:
`menv default`

`mrestart [<docker-machine name>]`
Equivalent to `docker-machine restart [name] && eval "$(docker-machine env [name])"`
Example:
`mrestart default`

`mup [<docker-machine name>]`
Same as mstart
Example:
`mup default`

`dbuild <target name>`
Equivalent to `docker build -t $1 .`
Example: 
`dbuild myimage`

`dps`
Equivalent to `docker ps`
Example: 
`dps`

`dpsq`
Equivalent to `docker ps -q`
Example: 
`dpsq`

`dpsa`
Equivalent to `docker ps -a`
Example: 
`dpsa`

`dpsaq`
Equivalent to `docker ps -aq`
Example: 
`dpsaq`

`dstopall`
Equivalent to `docker stop $(docker ps -q)`
Example:
`dstopall`

`dkill <container id>`
Equivalent to `docker kill <container id>`
Example:
`dkill my_mysql`

`dkillall`
Equivalent to `docker kill $(docker ps -q)`
Example:
`dkillall`

`drmall`
Equivalent to `docker rm $(docker ps -q)`
Example:
`drmall`

`drmiall`
Equivalent to `docker rmi $(docker images -q)`
Example:
`drmiall`

`drun`
Alias to `docker run`
Example:
`drun -d redis`

`drunit`
Alias to `docker run -it`
Example:
`drunit ubuntu`

`dexec`
Alias to `docker exec -it`
Example:
`dexec mycontainer /bin/bash`

`dbash <container id or name>`
Equivalent to `docker exec -it [name/id] /bin/bash`
Example:
`dbash mycontainer`

`dbashg`
Equivalent to `docker ps | grep $1 | head -n 1 | dbash`
Example:
`dbashg mycont`


`dcclean`
Equivalent to `docker-compose stop; docker-compose rm -f;`
Example: 
`dcclean`

`dcstop`
Equivalent to `docker-compose stop` 
Example:
`dcstop`

`dcbuild`
Equivalent to `docker-compose build`
Example: 
`dcbuild`

`dcup [<service name>]`
Equivalent to `docker-compose up [<service name>]` 
Examples:
```
dcup
dcup redis
```

`dcupd [<service name>]`
Equivalent to `docker-compose up -d [<service name>]` 
Examples:
```
dcupd
dcupd redis
```

`dimages`
Equivalent to `docker images`
Example:
`dimages`


`dlogs <container id or name>`
Equivalent to docker logs <container id or name>
Example:
`dlogs my_redis`

`dtail <container id or name>`
Equivalent to docker logs -f --tail 10 <container id or name>
Example:
`dtail my_redis`


`drmi <image name or id>`
Equivalent to `docker rmi $@`
Examples:
```
drmi user/my_image:tag
drmi -f user/my_image:tag
```

`dcleani`
Equivalent to `docker rmi $(docker images | grep "^<none>" | awk "{print $3}")`
Example:
```
dcleani
```
