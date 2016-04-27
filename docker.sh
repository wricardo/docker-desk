#docker-machine ip [name]
mip() {
	if [ -n "$1" ]
	then
	  mname="$1"
	else  
	  mname="default"
	fi                   
	ip=$(docker-machine ip $mname)
	echo $ip

	exists=$(grep "$ip docker-machine-$mname" /etc/hosts )
	if [ ! -n "$exists" ]
	then
		echo "Configuring /etc/hosts"
		exists=$(grep "docker-machine-$mname" /etc/hosts )
		if [ -n "$exists" ]
		then
			sudo sed -i "" -e "s/.*docker-machine-$mname$/$ip docker-machine-$mname/" /etc/hosts
		else  
			sudo bash -c "echo \"$ip docker-machine-$mname\" >> /etc/hosts"
		fi                   
		echo "Added host entry docker-machine-$mname to $ip"
	else
		echo "Also available through hostname docker-machine-$mname"
	fi
}

#destroy and create docker-machine default
mredo() {
	mdestroy
	mcreate
}

#docker-machine rm [name]
mdestroy() {
	if [ -n "$1" ]
	then
	  mname="$1"
	else  
	  mname="default"
	fi           
	docker-machine kill $mname
	docker-machine rm $mname
}

#docker machine ls
mls() {
	docker-machine ls
}

#docker machine ssh [name]
mssh() {
	if [ -n "$1" ]
	then
	  mname="$1"
	else  
	  mname="default"
	fi           
	docker-machine ssh $mname
}

#docker machine create [name]
mcreate() {
	if [ -n "$1" ]
	then
	  mname="$1"
	else  
	  mname="default"
	fi           
	docker-machine create --driver=virtualbox $mname
}

#docker machine stop [name]
mstop() {
	if [ -n "$1" ]
	then
	  mname="$1"
	else  
	  mname="default"
	fi           
	docker-machine stop $mname
}

#docker machine status [name]
mstatus() {
	if [ -n "$1" ]
	then
	  mname="$1"
	else  
	  mname="default"
	fi           
	docker-machine status $mname
}

#docker machine start [name]
mstart() {
	if [ -n "$1" ]
	then
	  mname="$1"
	else  
	  mname="default"
	fi           
	docker-machine start $mname
}

#docker machine env [name]
menv() {
	if [ -n "$1" ]
	then
	  mname="$1"
	else  
	  mname="default"
	fi           
	eval "$(docker-machine env $mname)"
}

#docker machine restart [name]
mrestart() {
	if [ -n "$1" ] 
	then
	  mname="$1"
	else  
	  mname="default"
	fi          
	eval "$(docker-machine restart $mname)"
	menv $mname
}

#docker-machine start [name]
mup() {
	if [ -n "$1" ] 
	then
	  mname="$1"
	else  
	  mname="default"
	fi          
	docker-machine start $mname
}

#docker build -t $1 .
dbuild() {
	docker build -t $1 .
}

#docker ps
dps() {
	docker ps
}

#docker ps -a
dpsa() {
	docker ps -a
}

#docker build -t $1
db() {
	docker build -t "$1" .
}

#docker stop $(docker ps -q)
dstopall() {
	docker stop $(docker ps -q)
}

#docker kill $(docker ps -q)
dkillall() {
	docker kill $(docker ps -q)
}

#docker rm $(docker ps -aq)
drmall() {
	docker rm $(docker ps -aq)
}

#docker rmi $(docker images -q)
drmiall() {
	docker rmi $(docker images -q)
}

#alias docker run
alias drun="docker run"

#alias docker run -it...
alias drunit="docker run -it "

#alias docker exec -it...
alias dexec="docker exec -it"

#docker-compose stop; docker-compose rm -f;
dcclean(){
	docker-compose stop;
	docker-compose rm -f;
}

#docker-compose stop
dcstop(){
	docker-compose stop;
}


#docker-compose build
dcbuild() {
	docker-compose build
}

#docker-compose up
dcup() {
	if [ -n "$1" ]
	then
	  docker-compose up $1
	else  
	  docker-compose up
	fi                   
}

#docker-compose up -d
dcupd() {
	docker-compose up -d
}

#docker exec -it $1 /bin/bash
dbash() {
	dexec $1 /bin/bash
}

#docker ps | grep $1 | dbash
dbashg() {
	cid=$(dps | grep $1  | awk '{ print $1 }')
	dbash $cid 
}

#docker images
dimages() {
	docker images
}

#docker kill $@
dkill() {
	docker kill $@
}

#docker logs -f $1
dtail() {
	docker logs -f $1
}

#docker logs -f $1
dlogs() {
	dtail $1
}

#docker rmi $@
drmi() {
	docker rmi $@
}

#docker rmi all <none> images
dcleani() {
	docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
}
